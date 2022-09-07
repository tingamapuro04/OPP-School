# require_relative './student'
# require_relative './teacher'
# require_relative './nameable'
# require_relative './trimmer_Decorator'
# require_relative './capitalize_Decorator'

class Nameable
  def correct_name
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, name = 'Unknown')
    # super
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
    # super
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name
  end
end

class Student < Person
  def initialize(name, age, classroom)
    super(name, age)
    @classroom = classroom
  end

  def play_hooky()
    puts "¯\(ツ)/¯"
  end
end


class Classroom
  attr_accessor :label
  attr_reader :students
  def initialize(label)
    @label = label
    @students = []
  end

  def add_student(student)
    @students.push(student)
  end

end

student_1 = Student.new(23, 'alphonce', 101)
economics = Classroom.new('economics')
economics.add_student(student_1)
p economics.students.first
