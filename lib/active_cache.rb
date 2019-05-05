require 'active_record'
require 'active_cache/version'
require 'active_cache/cache_key'
require 'active_cache/find'
module ActiveCache
  class Error < StandardError; end
  class << self
    def cache
      @cache ||= defined?(::Rails.cache) ? Rails.cache : ActiveSupport::Cache::MemCacheStore.new
    end

    def fetch(key, &block)
      cache.fetch(key) do
        block.call if block_given?
      end
    end

    def write(key)
      cache.write(key)
    end

    def exist?(key)
      cache.exist?(key)
    end

    def delete(key)
      cache.delete(key)
    end

    def clear
      cache.clear
    end
  end
end

class ActiveRecord::Base
  include ActiveCache::CacheKey
  include ActiveCache::Find
end
