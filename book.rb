class Book
  attr_reader :borrowings
  attr_accessor :title, :author
  def initialize(title, author)
    @title = title
    @author = author
    @borrowings = []
  end
end