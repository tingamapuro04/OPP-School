require_relative 'spec_helper'
require './student'

describe 'Student' do
  student1 = Student.new(21, "Adyo")
  it 'Test self' do
    expect(student1.class).to be(Student)
  end

  it 'test name' do
    expect(student1.to_json).to be_kind_of String
  end

  it 'test classroom' do
    expect(student1.classroom).to respond_to(:length)
  end


end