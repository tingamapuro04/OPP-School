require_relative './book'
require_relative './student'
require_relative './teacher'
require_relative './rental'

def get_input(question)
  print question
  gets.chomp
end

class App
  attr_accessor :book, :rental, :people

  def initialize(book, people, rental)
    @book = book
    @rental = rental
    @person = person
  end

  def add_book
    puts
    title = get_input('Title: ').strip
    author = get_input('Author: ').strip
    @book << Book.new(title, author)
  end

  def create_person
    puts
    choice = get_input('Do you want to create a student (1) or a teacher (2)').to_i
    
    case choice
    when 1
      create_student
    
    when 2
      create_teacher
    end
  end

  def create_teacher
    puts
    age = get_input('Age: ').strip.to_i
    name = get_input('name: ').strip
    specialization = get_input('specialization: ').strip
    @people << Teacher.new(age, specialization, name:name)
    puts 'Teacher created successfully'
  end

  def create_student
    puts
    age = get_input('Age: ').strip.to_i
    name = get_input('Name: ').strip
    permission = get_input('Has parent permission? [Y/N]: ').strip

    case permission
    when 'Y'
      permission = true
    when 'N'
      permission = false
    end

    @people << Student.new(age, nil, parent_permission: permission, name: name)
    puts 'Student created successfully'
  end

  def create_rental
    unless @people.length.positive? && @book.length.positive?
      return puts 'There should be at least one book and one person. Kindly add at least one book and one person.'
    end

    puts
    puts 'Select a book from the following list ny number'
    list_book
    book_choice = get_input('').to_i

    while book_choice.negative? || book_choice >= @book.length
      book_choice = get_input("Please enter a number within 0 - #{@books.length - 1} range: ").to_i
    end
    book = @book[book_choice]
    puts 'Select a person from the following list by number (not id)'
    list_people
    person_choice = get_input('').chomp.to_i

    while person_choice.negative? || person_choice >= @people.length
      person_choice = get_input("Please enter a number within 0 - #{@people.length - 1} range: ").to_i
    end
    person = @people[person_choice]
    date = get_input('Enter the day of booking: (yyyy/mm/dd)').strip
    @rentals
  end

  def list_people
    puts
    @people.each_with_index do |person, index|
      print "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"

      if person.instance_of?(student)
        puts ", Parent Permission: #{person.parent_permission}"
      else
        puts ", Specialization: #{person.specialization}"
      end

    end
  end

  def list_rentals
    puts
    person_id = get_input('Id of person: ')
    person = get_person(person_id)
    puts 'Rentals'
    person.rentals.each do |rental|
      puts "Date: #{rental.date} Book: #{rental.book.title} by #{rental.book.author}"
    end
  end

  def get_person(id)
    @people.each do |person|
      return person if person.id == id
    end
  end
end

