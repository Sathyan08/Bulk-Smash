require 'rails_helper'

feature 'user can find friends via the index page and then submit a friend request', %Q(

  As a user of Bulk Smash,
  I want to be able to find my friends
  so that I can

) do

  scenario 'user signs in' do
    user = FactoryGirl.create(:user)
    friendee = FactoryGirl.create(:friendee)

    visit root_path
    click_link 'Sign in'

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    visit users_path

    click_link friendee.email

    click_link 'Send Friend Request'


    expect(page).to have_content("Friend Request Successfully Sent.")
  end
end
