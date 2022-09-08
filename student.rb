require_relative './person'

class Student < Person
  attr_reader :classroom, :borrowings

  def initialize(age, classroom, parent_permission: true, name: 'Unknown', id: SecureRandom.hex(5))
    super(age, parent_permission: parent_permission, name: name, id: id)
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
