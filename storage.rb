require 'json'

def save_people(people)
  JSON.generate(people, File.open('./database/teacher.json', 'w'))
end

def save_book(books)
  JSON.generate(books, File.open('./database/book.json', 'w'))
end

def save_rentals(rentals)
  JSON.generate(rentals, File.open('./database/rentals.json', 'w'))
end

def save_data(item)
  save_people(item.people)
  save_rentals(item.rentals)
  save_book(item.books)
end