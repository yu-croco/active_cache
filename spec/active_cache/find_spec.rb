require 'spec_helper'

RSpec.describe ActiveCache do
  describe '.find' do
    let!(:user){User.create(first_name: "Taro", last_name: "Yamada", age: 35)}

    context 'if args is INT' do
      it 'data should be stored in cache after find' do
        expect(ActiveCache::Cache.exist?("active_cache/user/find/#{user.id}")).to eq false
        User.find(user.id)
        expect(ActiveCache::Cache.exist?("active_cache/user/find/#{user.id}")).to eq true
      end
    end

    context 'if args is Array' do
      let!(:user2){User.create(first_name: "Taro", last_name: "Yamada", age: 35)}
      it 'data should not be stored in cache after find' do
        expect(ActiveCache::Cache.exist?("active_cache/user/find/#{user.id}")).to eq false
        User.find([user.id, user2.id])
        expect(ActiveCache::Cache.exist?("active_cache/user/find/#{user.id}")).to eq false
        expect(ActiveCache::Cache.exist?("active_cache/user/find/#{user2.id}")).to eq false
      end
    end
  end
end
