module ActiveCache
  module Find
    extend ActiveSupport::Concern
    include ActiveCache::CacheKey

    module ClassMethods
      def find(*args)
        return super if !activate_cache ||
                        args.size != 1 ||
                        block_given? ||
                        !args.first.is_a?(Integer)
        key = key_name(self.name.underscore, __method__)
        ActiveCache.fetch(cache_key(key, args.first)){ super }
      end

      def activate_cache(active_flg=false)
        @active_cache ||= active_flg
      end

      private
        def key_name(klass_name, metod_name)
          "#{klass_name}/#{metod_name}"
        end
    end
  end
end
