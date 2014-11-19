require 'rails_helper'

feature 'user can find friends via the index page and then submit a friend request', %Q(

  As a user of Bulk Smash,
  I want to be able to find my friends
  so that I can

) do

  scenario 'user signs in' do
    user = FactoryGirl.create(:user)

    visit root_path
    click_link 'Sign in'

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    20.times { FactoryGirl.create(:user) }

    save_and_open_page
  end

end
