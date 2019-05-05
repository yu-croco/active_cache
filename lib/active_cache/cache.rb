module ActiveCache
  class Cache
    include Config
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
          @cache ||= ActiveSupport::Cache::MemCacheStore.new(expired_in)
        end
    end
  end
end
