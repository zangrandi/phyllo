require 'phyllo/actions'

module Phyllo
  module Models
    class User
      include Actions

      def path
        'users'
      end

      def find_by_external_id(external_id)
        get("#{path}/external_id/#{external_id}")
      end

      def all(limit: 10, offset: 0)
        get("#{path}?limit=#{limit}&offset=#{offset}")["data"]
      end

      def create(name:, external_id:)
        post(path, { name: name, external_id: external_id }).parsed_response
      end
    end
  end
end