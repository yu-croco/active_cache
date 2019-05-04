module ActiveCache
  module Find
    extend ActiveSupport::Concern
    module ClassMethods
      def find(*args)
        return super unless activate_cache
        ids = args.flatten.compact.uniq
        return super if ids.size != 1 || block_given? || args.first.is_a?(Array)

        ActiveCache.fetch(cache_key(key_name(self.name.underscore, __method__), ids.first)) do
          super
        end
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
