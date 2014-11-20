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

    2.times { FactoryGirl.create(:user) }

    visit users_path

    click_link 'generic_email2@gmail.com'

    click_link 'Send Friend Request'

    save_and_open_page
    expect(page).to have_content("Friend Request Successfully Submitted.")
  end

end
