class Student < Person
  def initialize(classroom)
    super(name, age)
    @classroom = classroom
  end

  def play_hooky
    return "¯\(ツ)/¯"
  end
end
