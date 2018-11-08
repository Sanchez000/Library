require_relative '../validation/validate'
# Define class
class Reader
  attr_accessor :name, :email, :city, :street, :house
  include Validate
  def initialize(name, email, city, street, house)
    @name = name
    @email = email
    @city = city
    @street = street
    @house = house
    [name, email, city, street].each { |x| validate_s!(x) }
    validate_mail! email
    validate_n! house
  end
end
