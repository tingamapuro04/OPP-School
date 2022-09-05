class Person
  attr_accessor :name, :age
  attr_reader :id

  def initialize(name = "Unknown", age)
    @id = Random.rand(1...1000)
    @name = name
    @age = age
    @parent_permission = true
  end

  def can_use_services
    is_of_age or @parent_permission
  end

  private

  def is_of_age
    if @age >= 18
      return true
    else
      return false
    end
  end
end

me = Person.new('alphonce', 1)

p me.can_use_services
