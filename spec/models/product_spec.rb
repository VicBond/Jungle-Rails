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

    it "is not valid without a name" do
      subject.name = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages.first).to include "Name can't be blank"
    end
    it "is not valid without a price" do
      subject.price_cents = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include "Price can't be blank"
    end
    it "is not valid without a quantity" do
      subject.quantity = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages.first).to include "Quantity can't be blank"
    end
    it "is not valid without a category" do
      subject.category = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages.first).to include "Category can't be blank"
    end
  end
  
end
