require 'faraday_middleware'
require 'faraday/request/multipart_with_file'
require 'faraday/request/multipart'

module Vk
  module Connection
    private

      def connection
        options = {
          :headers => {
            :user_agent => user_agent
          },
          :url => endpoint
        }

        Faraday.new options do |builder|
          builder.use Faraday::Request::MultipartWithFile
          builder.use Faraday::Request::Multipart
          builder.use Faraday::Request::UrlEncoded

          builder.use Faraday::Response::Mashify
          builder.use Faraday::Response::ParseJson

          builder.response :logger

          builder.adapter(adapter)
        end
      end
  end
end
