module ODP
  module JsonErrorHelper
    module ClassMethods
      def ok?; false end
      def error_message; "JSON parse error" end
      def status; 500 end
    end
  end
end
