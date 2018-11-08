require_relative '../validation/validate'
require_relative 'author'
#  Define class
class Book
  attr_accessor :title, :author
  include Validate
  def initialize(title, author)
    @title = title
    ArgumentError.new('Must be instance of Author!') unless author.is_a? Author
    @author = author
    validate_s! title
  end
end
