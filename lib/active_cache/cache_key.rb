module ActiveCache
  module CacheKey
    extend ActiveSupport::Concern
    module ClassMethods
      def create_key(klass, method, id)
        "#{base_key}/#{klass}/#{method}/#{id}"
      end

      private
        def base_key
          'active_cache'
        end
    end
  end
end
