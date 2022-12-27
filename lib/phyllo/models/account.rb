require 'phyllo/actions'

module Phyllo
  module Models
    class Account
      include Actions

      def path
        'accounts'
      end

      def where(user_id:, limit: 10, offset: 0)
        get("#{path}?user_id=#{user_id}&limit=#{limit}&offset=#{offset}")["data"]
      end

      def find_by(id:)
        get("#{path}/#{id}")
      end
    end
  end
end