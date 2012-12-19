require 'spec_helper'
require 'json'
describe Vk::Client do
  it 'should has setters and getterd for endpoint, user_agent, adapter, timeout and access_token configuration options' do
    %w(endpoint user_agent adapter timeout access_token).each do |m|
      subject.should respond_to(m)
      subject.should respond_to(m + '=')
      subject.send(m+'=', 'value' + m)
      subject.send(m).should == 'value' + m
    end
  end

  describe 'constructor' do
    it 'should accept options' do
      options = { endpoint: 123, user_agent: 'lynx', adapter: 'patron', timeout: 12, access_token: 'knock, knock' }
      client = described_class.new options
      options.each do |k, v|
        client.send(k).should == v
      end
    end
  end

  shared_examples_for :method do |method|   
    before{ subject.access_token = 'token123' }

    it 'should accept path as first argument' do
      stub_request(method, /.*/).to_return(body: {}.to_json)
      subject.send(method, 'some.path')
      an_api_request(method, "some.path", access_token: 'token123').should have_been_made
    end 

    it 'should accept options as second argument' do
      stub_request(method, /.*/).to_return(body: {}.to_json)
      subject.send(method, 'some.path', :name => 'Joe')
      an_api_request(method, "some.path", access_token: 'token123', name: 'Joe').should have_been_made
    end

    it 'should return Vk::Response' do
      stub_request(method, /.*/).to_return(body: { response: 'Everything is fine!' }.to_json)      
      r = subject.send(method, 'some.path')
      r.should be_a(Vk::Response)
      r.response.should == 'Everything is fine!'
    end

    it 'should raise Vk::ResponseError when response contains error method' do
      stub_request(method, /.*/).to_return(body: { response: 'Everything is fine!', 
                                                   error: { error_code: 123, error_msg: 'Error!' } }.to_json)      
      expect{ subject.send(method, 'some.path') }.to raise_error(Vk::ResponseError, '123 Error!')
    end

    it 'should raise Vk::ResponseError when response contains bad JSON' do
      stub_request(method, /.*/).to_return(body: 'JSON Borne')      
      expect{ subject.send(method, 'some.path') }.to raise_error(Vk::ResponseError, 'JSON parse error!')
    end

    it 'should raise Vk::Error Timeout instead Faraday::Error::TimeoutError' do
      stub_request(method, /.*/).to_return{ raise Timeout::Error }
      expect{ subject.send(method, 'some.path') }.to raise_error(Vk::Error, 'Timeout')
    end

    it 'should raise Vk::Error Timeout instead Timeout::Error' do
      Vk::Response.stub(:new){ raise Timeout::Error }
      stub_request(method, /.*/).to_return(body: {}.to_json)      
      expect{ subject.send(method, 'some.path') }.to raise_error(Vk::Error, 'Timeout')
    end
  end

  describe '#get' do
    it_should_behave_like :method, :get
  end

  describe '#post' do
    it_should_behave_like :method, :post
  end

  describe '#put' do
    it_should_behave_like :method, :put
  end

  describe '#delete' do
    it_should_behave_like :method, :delete
  end
end

