require './student'
require './teacher'

class Person
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, name = 'Unknown')
    @id = Random.rand(1...1000)
    @name = name
    @age = age
    @parent_permission = true
  end

  def can_use_services
    of_age or @parent_permission
  end

  private

  def of_age
    return true if @age >= 18
  end
end

Person.new(34, 'Adoyo')
me = Student.new('STD 6')

p me.play_hooky
