class Rental
  attr_accessor :date, :person, :book

  def initialize(date, person, book)
    @date = date

    @person = person
    person.borrowings << self

    @book = book
    book.borrowings << self
  end
end
