module ActiveCache
  module FindWithCache
    extend ActiveSupport::Concern

    module ClassMethods
      def find_with_cache?(flg = false)
        @is_cache_find ||= flg
      end

      def find_with_cache(*args)
        if find_with_cache?
          cache_key = CacheKeyFormat.create_key(args.first)
          ActiveCache::Cache.fetch(cache_key) do
            find(*args)
          end
        end
      end
    end
  end
end
