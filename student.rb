require_relative './person'
class Student < Person
  attr_reader :classroom, :borrowings

  def initialize(classroom, name, age)
    super(name, age)
    @classroom = classroom
    @borrowings = []
  end

  def play_hooky()
    puts "¯\(ツ)/¯"
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
