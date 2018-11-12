class Reader
  attr_reader :name, :email, :city, :street, :house
  include Validate
  def initialize(name, email, city, street, house)
    [name, email, city, street].each { |x| validate_s! x }
    @name = name
    @city = city
    @street = street
    validate_mail! email
    @email = email
    validate_n! house
    @house = house
  end
end
