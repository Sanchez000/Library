require_relative '../validation/validate'
require_relative 'book'
require_relative 'reader'
# Define class
class Order
  attr_accessor :book, :reader, :date
  def initialize(book, reader, date = Time.now.to_s)
    @date = date
    if book.is_a? Book
      @book = book
    else
      ArgumentError.new('Argument must be instance of Book!')
    end
    if reader.is_a? Reader
      @reader = reader
    else
      ArgumentError.new('Argument must be instance of Reader!')
    end
  end
end
