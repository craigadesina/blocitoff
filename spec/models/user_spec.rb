require 'rails_helper'

RSpec.describe User, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  
  describe User do
    before do
    @user = create(:user)
    @user2 = build(:user, email: 'fake@')
    @user3 = build(:user, email: @user.email)

    end

    it "sends email when user signs up" do
      expect(ActionMailer::Base.deliveries.count).to eq 1
      expect(ActionMailer::Base.deliveries.first.to).to include(@user.email)
    end

    it "will not sign up with invalid email" do
      @user2.valid?
      expect(@user2.errors.full_messages).to include("Email is invalid")
    end

    it "will not sign up with duplicated email" do
      @user3.save
      expect(@user3.errors.full_messages).to include("Email has already been taken")
    end
  end
end
