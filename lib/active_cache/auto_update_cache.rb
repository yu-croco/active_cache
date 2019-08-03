module ActiveCache
  module AutoUpdateCache
    extend ActiveSupport::Concern

    included do
      after_update do |object|
        if !migration?(object)
          ActiveCache::Loggable.updated(object)
          cache_key = CacheKeyFormat.create_key(object.class, object.id)
          Cache.write(cache_key, object)
        end
      end

      after_save do |object|
        if !migration?(object)
          ActiveCache::Loggable.stored(object)
          cache_key = CacheKeyFormat.create_key(object.class, object.id)
          Cache.write(cache_key, object)
        end
      end

      after_destroy do |object|
        if !migration?(object)
          ActiveCache::Loggable.deleted(object.id)
          cache_key = CacheKeyFormat.create_key(object.class, object.id)
          Cache.delete(cache_key)
        end
      end
    end

    private
      def migration?(object)
        object.is_a?(ActiveRecord::SchemaMigration) ||
          object.is_a?(ActiveRecord::InternalMetadata)
      end
  end
end
