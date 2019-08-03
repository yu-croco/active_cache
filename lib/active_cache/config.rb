module ActiveCache
  module Config
    require 'yaml'

    class << self
      def expired_in
        @expired_config ||= { expires_in: set_expired_in }
      end

      private
        def set_expired_in
          if defined?(::Rails.root)
            yml = YAML.load_file(Rails.root.join("app/config/active_cache.yml"))
            yml["expired_in"].present? ? yml["expired_in"] : default_expired_in
          else
            default_expired_in
          end
        end

        def default_expired_in
          1.hours.freeze
        end
    end
  end
end

