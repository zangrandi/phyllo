require 'httparty'

module Phyllo
  module Actions
    def headers
      {
        'Content-Type' => 'application/json',
        :Accepts => 'application/json',
        :Authorization => "Basic #{Phyllo.configuration.api_key}"
      }
    end

    def base_url
      if Phyllo.configuration.sandbox
        "https://api.sandbox.getphyllo.com/v1"     
      else
        "https://api.getphyllo.com/v1"       
      end
    end

    def get(url)
      HTTParty.get(
        "#{base_url}/#{url}", 
        { headers: headers }
      ).parsed_response
    end

    def post(url, body)
      HTTParty.post(
        "#{base_url}/#{url}", 
        { headers: headers , body: body.to_json }
      )
    end

    def delete(url)
      HTTParty.delete(
        "#{base_url}/#{url}", 
        { headers: headers }
      ).parsed_response
    end

    def put(url, body)
      HTTParty.put(
        "#{base_url}/#{url}", 
        { headers: headers, body: body.to_json }
      )
    end
  end
end