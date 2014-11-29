require 'rails_helper'

feature 'user can add a new items to list', %Q(

  As a user of Bulk Smash,
  I want to be able to add new items to my list
  so that I can create grocery lists
) do

  scenario 'user adds a new item to his or her list' do

    user = FactoryGirl.create(:user)
    unit = FactoryGirl.create(:pound)
    food = FactoryGirl.create(:food)

    visit user_list_path(user)
    select food.name, from: "Food"
    fill_in "Amount", with: 10

    save_and_open_page

    click_button "Create List Item"

    expect(page).to have_content("Successfully Created!")
  end
end
