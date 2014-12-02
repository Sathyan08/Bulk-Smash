require 'rails_helper'

feature 'user can create new lists', %Q(

  As a user of Bulk Smash,
  I want to be able to create distinct grocery lists
  so that I can plan ahead or plan lists for particular occasions
) do

  scenario 'user creates a list' do

    user = FactoryGirl.create(:user)
    list = FactoryGirl.build(:list)

    visit new_user_list_path(user)

    fill_in "Name", with: list.name
    check "Current"

    click_button "Create List"

    expect(page).to have_content("Successfully Created!")
  end
end
