require "minitest"
require "minitest/warning/version"
require "minitest/warning/reporter"

module Minitest
  module Warning
    class << self
      attr_reader :warnings

      def enable!(path: nil)
        @enable= true
        @warnings = []
        @path = path
      end

      def enable?
        defined?(@enable) && @enable
      end

      def disable!
        @enable = false
      end

      def add_warning(message)
        if @path
          return unless message.match?(@path)
        end

        @warnings << message
      end

      def has_warning?
        !@warnings.empty?
      end
    end
  end
end

def Warning.warn(message)
  Minitest::Warning.add_warning(message) if Minitest::Warning.enable?
  super
end
