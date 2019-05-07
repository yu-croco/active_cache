require 'active_support/lazy_load_hooks'
require 'active_record'
require 'active_cache/version'
require 'active_cache/config'
require 'active_cache/cache_key_format'
require 'active_cache/cache'
require 'active_cache/find'

ActiveSupport.on_load :active_record do
  ::ActiveRecord::Base.send :include, ActiveCache::Find
end
