require_relative './rental'
class Book
  attr_accessor :title, :author
  attr_reader :borrowings

  def initialize(title, author)
    @title = title
    @author = author
    @borrowings = []
  end

  def add_borrow(book)
    @borrowings.push(book)
  end
end
