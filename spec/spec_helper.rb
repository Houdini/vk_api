$:.unshift File.expand_path('..', __FILE__)
$:.unshift File.expand_path('../../lib', __FILE__)

require 'vk'
require 'rspec'
require 'webmock/rspec'

Dir[File.join(File.expand_path('..', __FILE__), 'support', '**', '*.rb')].each {|f| require f}

RSpec.configure do |config|
  config.mock_with :rspec
end
