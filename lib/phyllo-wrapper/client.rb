module PhylloWrapper
  class Client
    BASE_URL = "https://api.sandbox.getphyllo.com/v1"

    attr_accessor :token

    def initialize(token)
      @token = token
    end

    def users(limit: 10, offset: 0)
      get("users?limit=#{limit}&offset=#{offset}")
    end

    def create_user(name: nil, external_id: nil)
      post("users", { name: name, external_id: external_id }).parsed_response
    end

    def create_sdk_token(user_id:, products: ["IDENTITY", "ENGAGEMENT"])
      post("sdk-tokens", { user_id: user_id, products: products }).parsed_response
    end

    def accounts_by_user_id(user_id, limit: 10, offset: 0)
      get("accounts?user_id=#{user_id}&limit=#{limit}&offset=#{offset}")
    end

    def profiles_by_account_id(account_id, limit: 10, offset: 0)
      get("profiles?account_id=#{account_id}&limit=#{limit}&offset=#{offset}")
    end

    def contents_by_account_id(account_id, limit: 10, offset: 0)
      get("social/contents?account_id=#{account_id}&limit=#{limit}&offset=#{offset}")
    end

    private

    def headers
      {
        'Content-Type' => 'application/json',
        :Accepts => 'application/json',
        :Authorization => "Basic #{token}"
      }
    end

    def get(url)
      HTTParty.get("#{BASE_URL}/#{url}", { headers: headers }).parsed_response["data"]
    end

    def post(url, body)
      HTTParty.post("#{BASE_URL}/#{url}", { headers: headers , body: body.to_json})
    end
  end
end