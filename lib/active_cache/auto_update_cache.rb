module ActiveCache
  module AutoUpdateCache
    extend ActiveSupport::Concern

    included do
      after_update do |object|
        cache_key = CacheKeyFormat.create_key(object.id)
        Cache.write(cache_key)
      end

      after_save do |object|
        cache_key = CacheKeyFormat.create_key(object.id)
        Cache.write(cache_key)
      end

      after_destroy do |object|
        cache_key = CacheKeyFormat.create_key(object.id)
        Cache.delete(cache_key)
      end
    end
  end
end
