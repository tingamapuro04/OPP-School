require 'spec_helper'
require './book'

describe 'Student' do
  it 'Test self class' do
    book1 = Book.new('Chinua', 'Achebe')
    expect(book1.class).to be(Book)
  end
end

describe 'Student' do
  it 'Test kind of' do
    book1 = Book.new('Chinua', 'Achebe')
    book2 = book1.to_json
    expect(book2).to be_kind_of String
  end
end