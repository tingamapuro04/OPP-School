require_relative 'spec_helper'
require './book'

describe 'Book' do
  it 'Test self class' do
    book1 = Book.new('Chinua', 'Achebe')
    expect(book1.class).to be(Book)
  end
end

describe 'Book' do
  it 'Test kind of' do
    book1 = Book.new('Chinua', 'Achebe')
    book2 = book1.to_json
    expect(book2).to be_kind_of String
  end
end