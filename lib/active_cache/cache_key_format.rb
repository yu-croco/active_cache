module ActiveCache
  module CacheKeyFormat
    class << self
      def create_key(klass, id)
        "#{base_key}/#{klass}/#{id}"
      end

      private
        def base_key
          "active_cache/#{ActiveCache::VERSION}"
        end
    end
  end
end
