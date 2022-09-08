require_relative './person'

class Teacher < Person
  def initialize(age, specialization, name = 'unknown', parent_permission = true)
    super(age, name, parent_permission)
    @specialization = specialization
  end

  def to_json(*_args)
    {
      class: self.class,
      age: age,
      specialization: specialization,
      name: name,
      parent_permission: parent_permission
      }.to_json
  end

  def can_use_services()
    true
  end
end
