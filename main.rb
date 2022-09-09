require './app'

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
  puts 'Please choose an option by entering a number:'
  options.each_with_index do |option, index|
    puts "#{index + 1} - #{option}"
  end
end

def execute_option(option, app) # rubocop:disable Metrics/CyclomaticComplexity
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
    puts 'Invalid option'
  end
  false
end

def main
  puts 'Welcome to School Library App!'
  app = App.new
  exit = false
  while exit == false
    print_options
    exit = execute_option(gets.chomp, app)
  end
  puts 'Thank you for using this app!'
end

main
