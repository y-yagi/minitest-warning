module Minitest
  module Warning
    module Reporter
      def passed?
        return true unless Minitest::Warning.enable?
        !Minitest::Warning.has_warning?
      end

      def summary # :nodoc:
        extra = ""

        if Minitest::Warning.enable?
          extra += ", %d warnings" % Minitest::Warning.warnings.size
        end

        extra += "\n\nYou have skipped tests. Run with --verbose for details." if
          results.any?(&:skipped?) unless options[:verbose] or ENV["MT_NO_SKIP_MSG"]

        "%d runs, %d assertions, %d failures, %d errors, %d skips%s" %
          [count, assertions, failures, errors, skips, extra]
      end
    end
  end
end
