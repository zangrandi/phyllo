require 'phyllo/actions'

module Phyllo
  module Models
    class SdkToken
      include Actions

      def path
        'sdk-tokens'
      end

      def create(user_id:, products: ["IDENTITY", "ENGAGEMENT"])
        post(path, { user_id: user_id, products: products }).parsed_response
      end
    end
  end
end