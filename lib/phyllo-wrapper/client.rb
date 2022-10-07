module PhylloWrapper
  class Client
    class << self
      attr_accessor :configuration

      def configure
        self.configuration ||= Configuration.new
        yield(configuration)
      end

      # TODO: Extract to classes

      def users(limit: 10, offset: 0)
        get("users?limit=#{limit}&offset=#{offset}")["data"]
      end

      def accounts(user_id: nil, limit: 10, offset: 0)
        get("accounts?user_id=#{user_id}&limit=#{limit}&offset=#{offset}")["data"]
      end

      def account(id:)
        get("accounts/#{id}")
      end

      def profile(id:)
        get("profiles/#{id}")
      end

      def content(id)
        get("social/contents/#{id}")
      end

      def profiles(account_id: nil, limit: 10, offset: 0)
        get("profiles?account_id=#{account_id}&limit=#{limit}&offset=#{offset}")["data"]
      end

      def contents(account_id: nil, limit: 10, offset: 0, filters: "")
        get("social/contents?account_id=#{account_id}&limit=#{limit}&offset=#{offset}&filters=(#{filters})")["data"]
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

      def work_platforms(name: nil, limit: 10, offset: 0)
        get("work-platforms?limit=#{limit}&offset=#{offset}&name=#{name}")["data"]
      end

      def create_webhook(url:, events:)
        post("webhooks", {url: url, events: events})
      end

      def retrieve_webhooks(id: nil, limit: 10 , offset: 0)
        url = "webhooks"
        if id.nil?
          url+= "?limit=#{limit}&offset=#{offset}"
        else
          url+= "?id=#{id}"
        end

        get(url)
      end

      def delete_webhook(id:)
        delete("webhooks/#{id}")
      end

      def update_webhook(id:, url:, events:, is_active: true)
        put("webhooks/#{id}", {url: url, events: events, is_active: is_active})
      end

      private

      def headers
        {
          'Content-Type' => 'application/json',
          :Accepts => 'application/json',
          :Authorization => "Basic #{PhylloWrapper::Client.configuration.api_key}"
        }
      end

      def base_url
        if PhylloWrapper::Client.configuration.sandbox
          "https://api.sandbox.getphyllo.com/v1"     
        else
          "https://api.getphyllo.com/v1"       
        end
      end

      def get(url)
        HTTParty.get("#{base_url}/#{url}", { headers: headers }).parsed_response
      end

      def post(url, body)
        HTTParty.post("#{base_url}/#{url}", { headers: headers , body: body.to_json})
      end

      def delete(url)
        HTTParty.delete("#{base_url}/#{url}", { headers: headers }).parsed_response
      end

      def put(url, body)
        HTTParty.put("#{base_url}/#{url}", { headers: headers, body: body.to_json })
      end
    end

    class Configuration
      attr_accessor :api_key, :sandbox
    end
  end
end