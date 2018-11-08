# Define validation module
module Validate
  def validate_s!(arg)
    ArgumentError.new("#{arg} must be a string!") unless arg.class == String
    ArgumentError.new('Argument must not be empty!') unless arg.empty?
  end
 
  def validate_n!(arg)
    ArgumentError.new("#{arg} must be a Integer!") unless arg.class == Integer
  end
 
  def validate_mail!(arg)
    ArgumentError.new('Email must be in format - example@mail.com!') unless /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i =~ arg
  end
end
