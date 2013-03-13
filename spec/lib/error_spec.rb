require 'spec_helper'

describe Vk::Error do
  it 'should define REVOKE_ACCESS' do
    defined?(Vk::Error::REVOKE_ACCESS).should be_true
    Vk::Error::REVOKE_ACCESS.should == 5
  end

  it 'should allow raise error via raise with message' do
    expect{ raise described_class, 'Some message' }.to raise_error(described_class, 'Some message')
  end

  it 'should accept  error code as second argument in constructor' do
    expect{ described_class.new 'Message', 123 }.to_not raise_error
  end

  it 'should respond to code which returns error code' do
    e = described_class.new 'Message', 123
    e.code.should == 123
  end

  it 'should return message with error code when it is a Fixnum greater than 0' do
    [nil, 'Some', -1, 0].each do |code|
      described_class.new('Message', code).message.should == 'Message'
    end

    described_class.new('Message', 1).message.should == '1 Message'
  end
end
