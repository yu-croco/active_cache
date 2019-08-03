require 'active_support/lazy_load_hooks'
require 'active_record'
require 'active_cache/version'
require 'active_cache/config'
require 'active_cache/cache_key_format'
require 'active_cache/cache'
require 'active_cache/loggable'
require 'active_cache/auto_update_cache'
require 'active_cache/find_with_cache'

module ActiveCache
  class << self
    def base_modules
      [
        ActiveCache::FindWithCache,
        ActiveCache::AutoUpdateCache
      ]
    end
  end
end

ActiveSupport.on_load :active_record do
  ::ActiveCache.base_modules.each do |m|
    ActiveRecord::Base.send(:include, m)
  end
end
