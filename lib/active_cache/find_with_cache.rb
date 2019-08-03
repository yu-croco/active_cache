module ActiveCache
  module FindWithCache
    extend ActiveSupport::Concern

    module ClassMethods
      def find_with_cache?(flg = false)
        @is_cache_find ||= flg
      end

      def find_with_cache(id)
        raise ArgumentError, 'Invalid Argument(id)' unless id.is_a?(Integer)

        if find_with_cache?
          ActiveCache::Loggable.stored(id)
          cache_key = CacheKeyFormat.create_key(id)
          ActiveCache::Cache.fetch(cache_key) do
            find(id)
          end
        end
      end
    end
  end
end
