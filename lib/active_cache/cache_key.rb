module ActiveCache
  module CacheKey
    extend ActiveSupport::Concern
    module ClassMethods
      def cache_key(klass_name, id)
        "#{base_key}/#{klass_name}/#{id}"
      end

      def base_key
        "active_cache"
      end
    end
  end
end
