require './decorators/nameable/decorator'

class CapitalizeDecorator < Decorator
  def correct_name
    @name.correct_name.capitalize
  end
end
