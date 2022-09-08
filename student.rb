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

  def to_json(*_args)
    {
      class: self.class,
      id: id,
      age: age,
      name: name,
      parent_permission: parent_permission,
      classroom: classroom
    }.to_json
  end


end
