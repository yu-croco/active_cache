module ActiveCache
  module CacheKeyFormat
    class << self
      def create_key(id)
        "#{base_key}/#{id}"
      end

      private
        def base_key
          "active_cache/#{ActiveCache::VERSION}/"
        end
    end
  end
end
