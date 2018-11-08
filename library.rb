require_relative 'parts/author'
require_relative 'parts/book'
require_relative 'parts/reader'
require_relative 'parts/order'
require 'yaml'
# main class
class Library
  attr_accessor :book, :reader, :order, :author
  def initialize
    lib = YAML.load(File.read('lib.yml'))
    lib['book'] ? @book = lib['book'] : @book = {}
    lib['reader'] ? @reader = lib['reader'] : @reader = {}
    lib['order'] ? @order = lib['order'] : @order = {}
    lib['author'] ? @author = lib['author'] : @author = {}
  end

  def add(arg)
    cl_nm = arg.class.name.downcase
    xz = self.instance_variable_get("@#{cl_nm}")
    unless %w[book author reader order].index(cl_nm).nil?
      xz << hashed(arg)
      self.instance_variable_set("@#{cl_nm}", xz)
    else
      ArgumentError.new("#{cl_nm} not in allowed list of Classes!")
    end
  end

  def hashed(xxx)
    hash = {}
    xxx.instance_variables.each { |var| hash[var.to_s.delete('@')] = xxx.instance_variable_get(var) }
    hash
  end

  def top_reader(count = 1)
    puts self.top('reader', count)
  end
  def top(entity, count)
    temp_h = Hash.new(0)
    entity == 'book' ? @order.each { |row| temp_h[row[entity].title] += 1 } : @order.each { |row| temp_h[row[entity].name] += 1 }
    temp_h.sort_by { |_, v| -v }.first(count).map(&:first)
  end
   
  def most_popular_books(count = 1)
    puts self.top('book', count)
  end

  def count_top_readers(count = 3)
    books_names = self.top('book', count)
    arr = []
    books_names.each do |book_title|
    @order.each { |row| arr << row['reader'].name if book_title == row['book'].title }
    end
    puts arr.uniq.size
  end

  def save
    File.open('lib.yml', 'r+') { |file| file.write(YAML::dump(hashed(self))) }
  end
end
