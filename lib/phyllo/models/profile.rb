require 'phyllo/actions'

module Phyllo
  module Models
    class Profile
      include Actions

      def path
        'profiles'
      end

      def where(account_id:, limit: 10, offset: 0)
        get("#{path}?account_id=#{account_id}&limit=#{limit}&offset=#{offset}")["data"]
      end

      def find_by(id:)
        get("#{path}/#{id}")
      end
    end
  end
end