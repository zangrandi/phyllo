require 'phyllo/actions'

module Phyllo
  module Models
    class WorkPlatform
      include Actions

      def path
        'work-platforms'
      end

      def work_platforms(name: nil, limit: 10, offset: 0)
        url = "#{path}?limit=#{limit}&offset=#{offset}"
        url << "&name=#{name}" if name
        get(url)["data"]
      end
    end
  end
end