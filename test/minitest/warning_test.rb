require "test_helper"

class Minitest::WarningTest< Minitest::Test
  attr_accessor :reporter, :output

  def setup
    @output = StringIO.new("")
    @reporter = Minitest::CompositeReporter.new

    reporter << Minitest::SummaryReporter.new(output)
  end

  def test_warning
    test_case = Class.new(Minitest::Test) do
      Minitest::Warning.enable!

      def test_success
        eval("Minitest; assert true")
      end
    end

    reporter.start
    reporter.record(test_case.new(:test_success).run)
    reporter.report

    refute reporter.passed?
    assert_match "1 runs, 1 assertions, 0 failures, 0 errors, 0 skips, 1 warnings", output.string
  ensure
    Minitest::Warning.disable!
  end

  def test_warning_with_path
    test_case = Class.new(Minitest::Test) do
      Minitest::Warning.enable!(path: "unexistpath")

      def test_success
        eval("Minitest; assert true")
      end
    end

    reporter.start
    reporter.record(test_case.new(:test_success).run)
    reporter.report

    assert reporter.passed?
    assert_match "1 runs, 1 assertions, 0 failures, 0 errors, 0 skips, 0 warnings", output.string
  ensure
    Minitest::Warning.disable!
  end
end
