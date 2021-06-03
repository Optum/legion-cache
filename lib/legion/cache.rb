require 'legion/cache/version'
require 'legion/cache/settings'

require 'legion/cache/memcached'
require 'legion/cache/redis'

module Legion
  module Cache
    class << self
      if Legion::Settings[:cache][:driver] == 'redis'
        include Legion::Cache::Redis
      else
        include Legion::Cache::Memcached
      end

      def setup(**opts)
        return Legion::Settings[:cache][:connected] = true if connected?

        return unless client(**Legion::Settings[:cache], **opts)

        @connected = true
        Legion::Settings[:cache][:connected] = true
      end

      def shutdown
        Legion::Logging.info 'Shutting down Legion::Cache'
        close
        Legion::Settings[:cache][:connected] = false
      end
    end
  end
end
