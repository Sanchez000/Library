require_relative 'validation/errors'
require_relative 'validation/validate'
require_relative 'parts/author'
require_relative 'parts/book'
require_relative 'parts/reader'
require_relative 'parts/order'
require 'yaml'
class Library
  attr_reader :book, :reader, :order, :author
  def initialize
    lib = YAML.load(File.read('lib.yml'))
    lib['book'] ? @book = lib['book'] : @book = {}
    lib['reader'] ? @reader = lib['reader'] : @reader = {}
    lib['order'] ? @order = lib['order'] : @order = {}
    lib['author'] ? @author = lib['author'] : @author = {}
  end

  def add(arg)
    class_name = arg.class.name.downcase
    unless %w[book author reader order].index(class_name).nil?
    old_value = self.instance_variable_get("@#{class_name}")
      old_value << hashed(arg)
      self.instance_variable_set("@#{class_name}", old_value)
    else
      ArgumentError.new("#{class_name} not in allowed list of Classes!")
    end
  end

  def hashed(klass)
    hash = {}
    klass.instance_variables.each { |var| hash[var.to_s.delete('@')] = klass.instance_variable_get(var) }
    hash
  end

  def most_popular_books(count = 1)
    grouped = @order.group_by{ |row| [row['book'].title, row['book'].author.name] }
    return grouped.sort_by { |k, v| -v.size }.first(count).map{ |k,v| v[0]['book'] }
  end
  
  def top_reader(count = 1)
    grouped = @order.group_by{ |row| [row['reader'].name, row['reader'].email] }
    return grouped.sort_by { |k, v| -v.size }.first(count).map{ |k,v| v[0]['reader'] }
  end
  
  def count_top_readers(count = 3)
    top_books = self.most_popular_books(count)
    arr = []
    top_books.each do |book|
    @order.each { |row| arr << row['reader']  if book <=> row['book'] }
    end
    return arr.uniq.size
  end

  def save
    File.open('lib.yml', 'r+') { |file| file.write(YAML::dump(hashed(self))) }
  end
end
