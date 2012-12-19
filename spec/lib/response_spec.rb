require 'spec_helper'
require 'ostruct'

describe Vk::Response do
  let!(:raw_response){ 
    rsp = mock('Faraday::Response') 
    rsp.stub(:body){ OpenStruct.new }
    rsp
  }

  let(:response){ described_class.new(raw_response) }

  describe 'constructor' do
    it 'should accept response as first param' do
      expect{ described_class.new(raw_response) }.to_not raise_error
    end

    it 'should raise "123 Something went wrong!" ResponseError' do
      raw_response.stub(:body){ OpenStruct.new(error: OpenStruct.new(error_code: 123, error_msg: 'Something went wrong!')) }
      expect{ described_class.new(raw_response) }.to raise_error(Vk::ResponseError, '123 Something went wrong!')
    end
  end

  it 'should delegate #status to raw_response#status' do
    raw_response.should_receive(:status)
    response.status
  end

  it 'should delegate #headers to raw_response#response_headers' do
    raw_response.should_receive(:response_headers)
    response.headers
  end
  
  it 'should delegate #response to raw_response#body#response' do
    body = mock('body')
    body.stub(:error)
    body.should_receive(:response)
    raw_response.stub(:body){ body }
    response.response
  end

  it 'should delegate #url to raw_response#url' do
    raw_response.should_receive(:url)
    response.url
  end
end