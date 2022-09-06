require_relative './student'
require_relative './teacher'
require_relative './nameable'
require_relative './trimmerDecorator'
require_relative './capitalizeDecorator'

class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, name = 'Unknown')
    super
    @id = Random.rand(1...1000)
    @name = name
    @age = age
    @parent_permission = true
  end

  def can_use_services()
    of_age or @parent_permission
  end

  def correct_name
    @name
  end

  private

  def of_age()
    return true if @age >= 18
  end
end

class Decorator < Nameable
  attr_accessor :nameable

  def initialize(nameable)
    super
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name
  end
end
