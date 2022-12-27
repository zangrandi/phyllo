module Phyllo
  module Models
    class Webhook < Base
      def path
        'webhooks'
      end

      def create(url:, events:)
        post(path, { 
          url: url, 
          events: events 
        })
      end

      def all(limit: 10 , offset: 0)
        get("#{path}?limit=#{limit}&offset=#{offset}")
      end

      def find_by(id:)
        get("#{path}/#{id}")
      end

      def destroy(id)
        delete("#{path}/#{id}")
      end

      def update_webhook(id:, url:, events:, is_active: true)
        put("#{path}/#{id}", { 
          url: url, 
          events: events, 
          is_active: is_active 
        })
      end
    end
  end
end
      