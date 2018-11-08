require_relative '../validation/validate'
#  Define class
class Author
  attr_accessor :name, :biography
  include Validate
  def initialize(name, biography = '')
    @name = name
    @biography = biography
    validate_s! name
  end
end
