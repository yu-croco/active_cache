require 'spec_helper'

RSpec.describe ActiveCache do
  describe '.find_with_cache' do
    let!(:user){User.create(first_name: "Taro", last_name: "Yamada", age: 35)}
    let(:cache_key){ActiveCache::CacheKeyFormat.create_key(user.id)}
    context 'if args is INT' do
      it 'data should be stored in cache after find' do
        expect(ActiveCache::Cache.exist?(cache_key)).to eq false
        User.find_with_cache(user.id)
        expect(ActiveCache::Cache.exist?(cache_key)).to eq true
      end
    end

    context 'if args is Array' do
      let!(:user2){User.create(first_name: "Taro", last_name: "Yamada", age: 35)}
      it 'raise ArgumentError' do
        expect { User.find_with_cache([user.id, user2.id]) }.to raise_error(ArgumentError)
      end
    end
  end
end
