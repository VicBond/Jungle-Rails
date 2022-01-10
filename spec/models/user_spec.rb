require 'rails_helper'

RSpec.describe User, type: :model do
  
  subject {
    described_class.new(
      name: "test",
      email: "test@test.com", 
      password: "password", 
      password_confirmation: "password"
    )
  }

  describe 'Validations' do

    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'it not valid without a name' do
      subject.name = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages.first).to include "Name can't be blank"
    end

    it 'it not valid without an email' do
      subject.email = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages.first).to include "Email can't be blank"
    end    

    it 'it not valid without a password' do
      subject.password = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages.first).to include "Password can't be blank"
    end 

    it 'it not valid without a password confirmation' do
      subject.password_confirmation = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages.first).to include "Password confirmation can't be blank"
    end 

    it 'it not valid when password not match password confirmation' do
      subject.password_confirmation = "PASSWORD"
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages.first).to include "Password confirmation doesn't match Password"
    end 

  end
end
