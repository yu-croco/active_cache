module ActiveCache
  module CacheKeyFormat
    class << self
      def create_key(klass, method, id)
        "#{base_key}/#{klass}/#{method}/#{id}"
      end

      private
        def base_key
          'active_cache'
        end
    end
  end
end
