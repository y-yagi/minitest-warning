require 'minitest/warning'

module Minitest
  def self.plugin_warning_init(opts)
    reporter.reporters.each do |reporter|
      reporter.class.prepend(Minitest::Warning::Reporter) if reporter.kind_of?(SummaryReporter)
    end
  end
end
