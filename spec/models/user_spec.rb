require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.create!(name: "User Name", email: "user@email.com", password:"password") }

  it { should have_many(:posts)}

  it { should validate_presence_of(:name) } 
  it { should validate_length_of(:name).is_at_least(3) }

  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }
  it { should validate_length_of(:email).is_at_least(10) }
  it { should allow_value("user@email.com").for(:email) }

  it { should validate_presence_of(:password) }
  it { should have_secure_password }
  it { should validate_length_of(:password).is_at_least(6) }

  describe "attributes" do
    it "shoulc have name and email attributes" do
      expect(user).to have_attributes(name: "User Name", email: "user@email.com")
    end
  end

  describe "invalid user" do
    let(:user_with_invalid_name) { User.new(name: "", email: "user@email.com") }
    let(:user_with_invalid_email) { User.new(name: "User Name", email: "") }

    it "should be an invalid user due to blank name" do
      expect(user_with_invalid_name).to_not be_valid
    end

    it "should be an invalid user due to blank email" do
      expect(user_with_invalid_email).to_not be_valid
    end
  end
end
