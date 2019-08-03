class User < ActiveRecord::Base
  find_with_cache?(true)
end
