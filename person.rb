require_relative './nameable'
require_relative './capitalize'
require_relative './trimmer'
require_relative './rental'
require 'securerandom'

class Person < Nameable
  attr_accessor :name, :age, :borrowings, :parent_permission
  attr_reader :id

  def initialize(age, parent_permission: true, name: 'Unknown', id: securerandom.hex(5))
    super()
    @id = id
    @name = name
    @age = age
    @parent_permission = parent_permission
    @borrowings = borrowings
  end

  def can_use_services()
    of_age or @parent_permission
  end

  def correct_name
    @name
  end

  # def add_borrow(book)
  #   @borrowings.push(book)
  # end

  def add_rental(date, book)
    Rental.new(date, book, self)
  end

  private

  def of_age()
    return true if @age >= 18
  end
end

class Decorator < Nameable
  attr_accessor :nameable

  def initialize(nameable)
    super()
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name
  end
end

class Capitalize < Decorator
  def correct_name
    @nameable.correct_name.capitalize
  end
end


class Trimmer < Decorator
  def correct_name
    @nameable.correct_name[0..9] if @nameable.correct_name.length > 10 || @nameable.correct_name
  end
end
