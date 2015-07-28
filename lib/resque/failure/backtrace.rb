module Resque
  module Failure
    class Backtrace < Base
      def save
        backtrace  = filter_backtrace(exception.backtrace)
        Logging.warn backtrace.join("\n")
      end

      private

      def filter_backtrace(backtrace)
        index = backtrace.index { |item| item.include?('/lib/resque/job.rb') }
        backtrace.first(index.to_i)
      end
    end
  end
end
