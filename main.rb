require_relative './app'

def print_options
  options = [
    'List all books',
    'List all people',
    'Create a person',
    'Create a book',
    'Create a rental',
    'List all rentals for a given person id',
    'Save & Exit'
  ]
  put 'Please select an option by entering a number for that option'
  options.each_with_index do |option, index|
    puts "#{index + 1} - #{option}"
  end
end


def execute_option(option, app)
  case option
  when '1'
    app.list_books
  when '2'
    app.list_people
  when '3'
    app.create_person

  when '4'
    app.add_book
  when '5'
    app.create_rental
  when '6'
    app.list_rentals
  when '7'
    return true
  else
    puts "Invalid option"
  end
  false
end

def main
  puts "Welcome to school library"
  app = App.new
  load_state(app)
  exit = false
  while exit == false
    print_options
    exit = execute_option(gets.chomp, app)
  end
  save_state(app)
  puts "Thank you for using our library"
end

main

