module ActiveCache
  module Loggable
    class << self
      def logger
        @logger ||= defined?(::Rails.logger) ? Rails.logger : Logger.new(STDOUT)
      end

      def stored(id)
        logger.info "[ActiveCache INFO] stored cache: #{id}"
      end

      def updated(id)
        logger.info "[ActiveCache INFO] updated cache: #{id}"
      end

      def deleted(id)
        logger.info "[ActiveCache INFO] deleted cache: #{id}"
      end
    end
  end
end
