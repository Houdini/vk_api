module Vk
  module TimeoutErrorHelper
    module ClassMethods
      def ok?; false end
      def error_message; "Timeout" end
      def status; 500 end
    end
  end
end
