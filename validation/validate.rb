module Validate
  def validate_s!(arg)
    raise ArgumentError.new("#{arg} must be a string!") unless arg.is_a? String
    raise ArgumentError.new('Argument must not be empty!') if arg.empty?
  end
 
  def validate_n!(arg)
    raise ArgumentError.new("#{arg} must be a Integer!") unless arg.is_a? Integer
  end
 
  def validate_mail!(arg)
    raise ArgumentError.new('Email must be in format - example@mail.com!') unless /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i =~ arg
  end
end
