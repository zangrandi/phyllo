module Phyllo
  class Config
    def configure
      yield(configuration) if block_given?
    end

     def configuration
      @configuration ||= Phyllo::Configuration.new
    end
  end
end