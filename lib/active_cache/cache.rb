module ActiveCache
  class Cache
    class << self
      def fetch(key, &block)
        cache.fetch(key) do
          block.call
        end
      end

      def write(key)
        cache.write(key)
      end

      def exist?(key)
        cache.exist?(key)
      end

      def delete(key)
        cache.delete(key)
      end

      def clear
        cache.clear
      end

      private
        def cache
          @cache ||= ActiveSupport::Cache::MemCacheStore.new(Config.expired_in)
        end
    end
  end
end
