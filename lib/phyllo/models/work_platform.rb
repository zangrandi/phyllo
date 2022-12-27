module Phyllo
  module Models
    class WorkPlatform < Base
      def path
        'work-platforms'
      end

      def all(limit: 10, offset: 0)
        get("#{path}?limit=#{limit}&offset=#{offset}")["data"]
      end
    end
  end
end