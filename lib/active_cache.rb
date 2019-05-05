require 'active_record'
require 'active_cache/version'
require 'active_cache/config'
require 'active_cache/cache_key'
require 'active_cache/cache'
require 'active_cache/find'

class ActiveRecord::Base
  include ActiveCache::Find
end
