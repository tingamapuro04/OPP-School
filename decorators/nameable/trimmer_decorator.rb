require './decorators/nameable/decorator'

class TrimmerDecorator < Decorator
  def correct_name
    @name.correct_name[0..9]
  end
end
