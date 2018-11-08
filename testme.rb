require_relative 'library'
l = Library.new
# test add entitys
=begin
a = Author.new("Robert Dwight")
#l.add(a)
#l.save
b = Book.new("Learn Ruby in 24 Hours or Less",a)
#l.add(b)
#l.save
r = Reader.new("Petya","Petya@mail.com","Kiev","Khreshatik",46)
#l.add(r)
#l.save
l.add(Order.new(b,r))
l.save
=end
# test statistics methods
#=begin
l.most_popular_books
#l.count_top_readers
#l.top_reader
#=end