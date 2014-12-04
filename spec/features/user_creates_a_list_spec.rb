require 'rails_helper'

feature 'user can create new lists', %Q(

  As a user of Bulk Smash,
  I want to be able to create distinct grocery lists
  so that I can plan ahead or plan lists for particular occasions
) do

  scenario 'user creates a list' do

    user = FactoryGirl.create(:user)
    list = FactoryGirl.build(:list)

    visit root_path
    click_link 'Sign in'

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    visit new_list_path

    fill_in "Name", with: list.name

    click_button "Create List"

    expect(page).to have_content("Successfully Created!")
  end
end
