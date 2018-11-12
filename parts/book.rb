class Book
  attr_reader :title, :author
  include Validate
  include CustomErrors
  def initialize(title, author)
    validate_s! title
    @title = title
    if author.is_a? Author
      @author = author
    else
      raise ArgumentInstanceError.new("Author")
    end
  end
end
