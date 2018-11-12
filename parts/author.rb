class Author
  attr_reader :name, :biography
  include Validate
  def initialize(name, biography = '')
    @name = name
    @biography = biography
    validate_s! name
  end
end
