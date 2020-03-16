module STP
  module Errors
    class STPError < StandardError
      def initialize(code = nil, message = nil)
        @code = code
        @message = message
      end

      def to_h
        { code: @code, message: @message }
      end

      def to_s
        to_h.to_s
      end
    end
  end
end