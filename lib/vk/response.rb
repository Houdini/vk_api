module Vk
  class Response
    def initialize(response)
      if response.body.error
        raise ResponseError.new(response.body.error.error_msg, response.body.error.error_code.to_i)
      else
        @response = response
      end
    end

    def status
      @response.status
    end

    def headers
      @response.response_headers
    end

    def response
      @response.body.response
    end

    def url
      @response.url
    end
  end
end
