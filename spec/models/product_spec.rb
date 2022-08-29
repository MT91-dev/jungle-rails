require 'rails_helper'

RSpec.describe Product, type: :model do
  let(:category) {Category.new(:name => 'Cards')}
  subject {described_class.new(:name => 'MTG', :price => 50, :quantity => 60, :category => category)} 
  
  describe 'Validations' do

    it 'successfully saves when all four fields are set and belong to a category' do
      subject.valid?
      expect(subject.errors).to be_empty
      assc = described_class.reflect_on_association(:category)
      expect(assc.macro).to eq :belongs_to
    end

    it 'will fail to save when the name is not set' do
      subject.name = nil
      subject.valid?
      expect(subject.errors).not_to be_empty
    end
    
    it 'will fail to save when the price is not set' do
      subject.price_cents = nil
      subject.valid?
      expect(subject.errors).not_to be_empty
    end

    it 'will fail to save when the quantity is not set' do
      subject.quantity = nil
      subject.valid?
      expect(subject.errors).not_to be_empty
    end

    it 'will fail to save when the category is not set' do
      subject.category = nil
      subject.valid?
      expect(subject.errors).not_to be_empty
    end

  end
end
