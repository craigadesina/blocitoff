require 'rails_helper'

feature 'User can sign up with name, email and password' do
  
  before do
   
    @user = build(:user)
   #@user_name = 'johnjudas' 
   #@user_email = 'john@example.com'
   #@user_password = 'helloworld'
   #@user_password_confirmation = @user_password

  end
  scenario 'Sign-up Successfully' do
    visit '/'
    expect( page ).to have_content('Welcome to Blocitoff')
    click_link 'Sign-up'
    fill_in 'Name', with: @user.name
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    fill_in 'Password confirmation', with: @user.password_confirmation
    click_button 'Sign up'
    #save_and_open_page
    expect(ActionMailer::Base.deliveries.count).to eq 1
    expect( page ).to have_content('A message with a confirmation link has been sent')
  end
end