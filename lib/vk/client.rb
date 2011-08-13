require 'vk/api'

module Vk
  class Client < Api
    require 'vk/client/audio'

    include Vk::Client::Audio
  end
end
