$:.unshift File.expand_path('..', __FILE__)
$:.unshift File.expand_path('../../lib', __FILE__)

require 'vk'
require 'rspec'
require 'webmock/rspec'

RSpec.configure do |config|
  config.mock_with :rspec
end
