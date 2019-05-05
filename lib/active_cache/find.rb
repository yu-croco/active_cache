module ActiveCache
  module Find
    extend ActiveSupport::Concern
    module ClassMethods
      def find(*args)
        return super if !activate_cache ||
                        args.size != 1 ||
                        block_given? ||
                        !args.first.is_a?(Integer)
        cache_key = CacheKeyFormat.create_key(self.name.underscore, __method__, args.first)
        ActiveCache::Cache.fetch(cache_key){ super }
      end

      def activate_cache(active_flg=false)
        @active_cache ||= active_flg
      end
    end
  end
end
