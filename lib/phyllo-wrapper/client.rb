module PhylloWrapper
  class Client
    BASE_URL = "https://api.sandbox.getphyllo.com/v1"

    class << self
      attr_accessor :configuration

      def configure
        self.configuration ||= Configuration.new
        yield(configuration)
      end

      # TODO: Extract to classes

      def users(limit: 10, offset: 0)
        get("users?limit=#{limit}&offset=#{offset}")
      end

      def accounts(user_id: nil, limit: 10, offset: 0)
        get("accounts?user_id=#{user_id}&limit=#{limit}&offset=#{offset}")
      end

      def profiles(account_id: nil, limit: 10, offset: 0)
        get("profiles?account_id=#{account_id}&limit=#{limit}&offset=#{offset}")
      end

      def contents(account_id: nil, limit: 10, offset: 0)
        get("social/contents?account_id=#{account_id}&limit=#{limit}&offset=#{offset}")
      end

      def user_by_external_id(external_id)
        get("users/external_id/#{external_id}")
      end

      def create_user(name:, external_id:)
        post("users", { name: name, external_id: external_id }).parsed_response
      end

      def create_sdk_token(user_id:, products: ["IDENTITY", "ENGAGEMENT"])
        post("sdk-tokens", { user_id: user_id, products: products }).parsed_response
      end

      private

      def headers
        {
          'Content-Type' => 'application/json',
          :Accepts => 'application/json',
          :Authorization => "Basic #{PhylloWrapper::Client.configuration.api_key}"
        }
      end

      def get(url)
        HTTParty.get("#{BASE_URL}/#{url}", { headers: headers }).parsed_response["data"]
      end

      def post(url, body)
        HTTParty.post("#{BASE_URL}/#{url}", { headers: headers , body: body.to_json})
      end
    end

    class Configuration
      attr_accessor :api_key
    end
  end
end