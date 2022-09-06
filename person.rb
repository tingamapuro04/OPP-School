# require_relative './student'
# require_relative './teacher'

class Nameable
  def correct_name
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, name = 'Unknown')
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
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name
  end
end

class CapitalizeDecorator < Decorator
  def correct_name
    @nameable.correct_name.capitalize
  end
end

class TrimmerDecorator < Decorator
  def correct_name
    @nameable.correct_name[0..9] if @nameable.correct_name.length > 10 || @nameable.correct_name
  end
end

person = Person.new(22, 'maximilianu99999s')
p person.correct_name
capitalizedPerson = CapitalizeDecorator.new(person)
p capitalizedPerson.correct_name
capitalizedTrimmedPerson = TrimmerDecorator.new(capitalizedPerson)
p capitalizedTrimmedPerson.correct_name
