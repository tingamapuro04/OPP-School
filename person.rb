require 'securerandom'
require './interfaces/nameable'
require './rental'

class Person < Nameable
  attr_accessor :name, :age, :rentals, :parent_permission
  attr_reader :id

  def initialize(age, parent_permission: true, name: 'Unknown', id: SecureRandom.hex(5))
    super()
    @id = id
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def add_rental(date, book)
    Rental.new(date, book, self)
  end

  def can_use_services?
    is_of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  private

  def is_of_age? # rubocop:disable Naming/PredicateName
    @age >= 18
  end
end
