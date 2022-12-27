require_relative '../actions'

module Phyllo
  module Models
    class Base
      include Actions
    end
  end

  include Models
end