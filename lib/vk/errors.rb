module Vk

  class Error < StandardError
    attr_reader :code

    REVOKE_ACCESS = 5
    REQUESTS_LIMIT_EXCEEDED = 6

    def initialize(msg, code = nil)
      @code = code
      super msg
    end

    def message
      if code.is_a?(Fixnum) && code > 0
        "%d %s" % [code, super]
      else
        super
      end
    end
  end

  class ResponseError < Error; end
end
