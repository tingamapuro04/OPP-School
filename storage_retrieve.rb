require 'json'

def get_people(people)
  data = JSON.parse(File.read('./database/people.json'))

  data.each do |person|
    if person['class'] == 'Student'
      people << Student.new(person['age'], nil, name: person['name'], parent_permission: person['parent_permission'], id: person['id'])
    else
      people << Teacher.new(person['age'], person['specialization'], name: person['name'], id: person['id'])
    end
  end
rescue StandardError
  puts "No student or teacher yet"
end

def get_books(books)
  data = JSON.parse(File.read('./database/book.json'))

  data.each do |item|
    books << Book.new(item['title'], item['author'])
  end
rescue StandardError
  puts "No book yet"
end

def get_rentals(rentals, books, people)
  data = JSON.parse(File.read('./database/rentals.json'))
  data.each do |rental|
    book = books.find { |item| item.title == rental['book']['title'] }
    person = people.find { |item| item.id == rental['person']['id'] }
    rentals << person.add_rental(rental['date'], book)
  end
rescue StandardError
  puts "No rentals yet!"
end

def get_data(app)
  get_people(app.people)
  get_rentals(app.rentals, app.books, app.people)
  get_books(app.books)
end
