require 'rails_helper'

feature 'User can sign up with name, email and password' do
  
  before do
   @user_name = 'johnjudas' 
   @user_email = 'john@example.com'
   @user_password = 'helloworld'
   @user_password_confirmation = @user_password

  end
  scenario 'Sign-up Successfully' do
    visit '/'
    expect( page ).to have_content('Welcome to Blocitoff')
    click_link 'Sign-up'
    fill_in 'Name', with: @user_name
    fill_in 'Email', with: @user_email
    fill_in 'Password', with: @user_password
    fill_in 'Password confirmation', with: @user_password
    click_button 'Sign up'
    save_and_open_page
    expect(ActionMailer::Base.deliveries.count).to eq 1
    expect( page ).to have_content('Welcome to Blocitoff')
  end
end