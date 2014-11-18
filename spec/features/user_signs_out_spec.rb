require 'rails_helper'

feature 'user logs out', %Q(

  As an authenticated user
  I want to sign out
  So that no one else can post items on my behalf

) do

  scenario 'user logs out' do
    user = FactoryGirl.create(:user)

    visit root_path
    click_link 'Sign in'

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    click_link 'Sign out'

    expect(page).to have_content('Signed out successfully')
  end

end
