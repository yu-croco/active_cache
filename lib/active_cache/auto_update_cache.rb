module ActiveCache
  module AutoUpdateCache
    extend ActiveSupport::Concern

    included do
      after_update do |object|
        ActiveCache::Loggable.updated(object.id)
        cache_key = CacheKeyFormat.create_key(object.id)
        Cache.write(cache_key)
      end

      after_save do |object|
        ActiveCache::Loggable.stored(object.id)
        cache_key = CacheKeyFormat.create_key(object.id)
        Cache.write(cache_key)
      end

      after_destroy do |object|
        ActiveCache::Loggable.deleted(object.id)
        cache_key = CacheKeyFormat.create_key(object.id)
        Cache.delete(cache_key)
      end
    end
  end
end
