require './person'

class Student < Person
  attr_reader :classroom

  def initialize(age, classroom, parent_permission: true, name: 'Unknown', id: SecureRandom.hex(5))
    super(age, parent_permission: parent_permission, name: name, id: id)
    @classroom = classroom
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self)
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

end