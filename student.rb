class Student < Person
  def initialize(classroom)
    super
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end  

end



private
  def is_of_age
    if @age >= 18
      true
    else
      false
    end
  end

def can_use_services
    if @age >= 18 or @parent_permission == true
      true
    else
      false
    end
  end


def initialize(name = "Unknown", age, parent_permission = "true")
    @id = Random.rand(1...1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

# attr_accessor :name, :age
  # attr_reader :id