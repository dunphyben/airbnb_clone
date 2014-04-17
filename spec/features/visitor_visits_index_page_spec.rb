require 'spec_helper'

def visiting
  visit root_path
  page.should have_content 'Sign up'
  page.should have_content 'Login'
  page.should have_content 'User Index'
end

describe User do
  it 'allows visitors to see the home page' do
    visiting
    click_link 'Sign up'

  end
  it 'allows visitors to sign up as users' do
    visiting
    click_link 'Sign up'
    page.should have_content 'Sign up'
    email = Faker::Internet.email
    fill_in 'Email', with: email
    password = Faker::Internet.password
    fill_in 'Password', with: password
    fill_in 'Password confirmation', with: password
    click_button 'Sign up'
    expect(page).to have_content 'Welcome! You have signed up successfully.'
  end
  it 'allows existing users to sign in' do
    visiting
    user = FactoryGirl.create(:user)
    click_link 'Login'
    page.should have_content 'Sign in'
    email = user.email
    fill_in 'Email', with: email
    password = user.password
    fill_in 'Password', with: password
    click_button 'Sign in'
    expect(page).to have_content 'Signed in successfully.'
  end
end
