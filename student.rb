require_relative './person'
class Student < Person
  def initialize(classroom, name, age)
    super(name, age)
    @classroom = classroom
  end

  def play_hooky()
    puts "¯\(ツ)/¯"
  end
end
