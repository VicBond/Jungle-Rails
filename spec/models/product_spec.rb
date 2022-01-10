require 'rails_helper'

RSpec.describe Product, type: :model do
  
  describe 'Validations' do
    subject {
      described_class.new(name: "Product Test",
                          price: 42,
                          quantity: 42,
                          category: Category.new)
    }

    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end
    
  end
  
end
