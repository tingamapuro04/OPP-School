require_relative './person'

class Teacher < Person
  def initialize(age, specialization, parent_permission: true, name: 'Unknown', id: SecureRandom.hex(5))
    super(age, parent_permission: parent_permission, name: name, id: id)
    @specialization = specialization
  end

  def can_use_services()
    true
  end
end
