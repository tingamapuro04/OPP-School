require 'json'

def get_people(people)
  data = JSON.parse(File.read('./database/people.json'))

  data.each do |item|
    people << {
    	id: item["id"],
    	name: item["name"],
    	parent_permission: item["permission"],
    	age: item["age"],
    	classroom: item["classroom"]
    }
  end
end

def get_books(books)
  JSON.parse(File.read('./database/book.json'))
end

def get_rentals(rentals)
  JSON.parse(File.read('./database/rentals.json'))
end

def get_data(app)
  get_people(app.people)
  get_rentals(app.rentals)
  get_books(app.books)
end