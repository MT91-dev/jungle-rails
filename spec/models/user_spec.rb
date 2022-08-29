require 'rails_helper'

RSpec.describe User, type: :model do

  subject {described_class.new(:first_name => 'Leeroy', :last_name => 'Jenkins', :email => 'azeroth@gamil.com', :password => "wow", :password_confirmation => "wow")}

  describe 'Validations do' do
    
    it 'saves successfully when all four feilds are set' do
      subject.valid?
      expect(subject.errors).to be_empty
    end

    it 'fails to save when the email is not set' do
      subject.email = nil
      subject.valid?
      expect(subject.errors).not_to be_empty
    end

    it 'fails to save when the first name is not set' do
      subject.first_name = nil
      subject.valid?
      expect(subject.errors).not_to be_empty
    end

    it 'fails to save when the last name is not set' do
      subject.last_name = nil
      subject.valid?
      expect(subject.errors).not_to be_empty
    end

    it 'fails to save when the password is not set' do
      subject.password = nil
      subject.valid?
      expect(subject.errors).not_to be_empty
    end

    it 'fails to save when the password_confirmation is not set' do
      subject.password_confirmation = nil
      subject.valid?
      expect(subject.errors).not_to be_empty
    end

    it 'fails to save when the password and password_confirmation does not match' do
      subject.password_confirmation = '111'
      subject.valid?
      expect(subject.errors).not_to be_empty
    end
    
    it 'fails to save when the email is not unique (not case sensitive)' do
      User.create(:first_name => 'Leeroy', :last_name => 'Jenkins', :email => 'azeroth@gamil.com', :password => "wow", :password_confirmation => "wow", :password_digest => "123")
      subject.valid?
      expect(subject.errors).not_to be_empty
    end

    it 'fails to save when the password and password_confirmation has a length less than 3 characters' do
      subject.password = 'wo'
      subject.password_confirmation = 'wo'
      subject.valid?
      expect(subject.errors).not_to be_empty
    end

    describe '.authenticate_with_credentials' do
      it 'returns user if succesfully authenticated' do
        subject.save
        user = User.authenticate_with_credentials('azeroth@gamil.com', 'wow')
        expect(subject).to be == user
      end

      it 'returns nil if authentication was not successful' do
        subject.save
        user = User.authenticate_with_credentials('azeroth@gamil.com', 'nah')
        expect(user).to be == nil
      end

      it 'authenticates the user if user types white space before or after email' do
        subject.save
        user = User.authenticate_with_credentials(' azeroth@gamil.com ', 'wow')
        expect(subject).to be == user
      end

      it 'authenticates the user if the user types lower and upper case in email' do
        subject.save
        user = User.authenticate_with_credentials('aZeRoTh@gAmil.com', 'wow')
        expect(subject).to be == user
      end
    end
    
  end
end