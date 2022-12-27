require_relative 'models/configuration'

module Phyllo
  module Config
    def configure
      yield(configuration) if block_given?
    end

     def configuration
      @configuration ||= Phyllo::Configuration.new
    end
  end

  extend Config
end