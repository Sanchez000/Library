class Order
  attr_reader :book, :reader, :date
  include CustomErrors
  def initialize(book, reader, date = Time.now.to_s)
    @date = date
    if book.is_a? Book
      @book = book
    else
      raise ArgumentInstanceError.new("Book")
    end
    if reader.is_a? Reader
      @reader = reader
    else
      raise ArgumentInstanceError.new("Reader")
    end
  end
end
