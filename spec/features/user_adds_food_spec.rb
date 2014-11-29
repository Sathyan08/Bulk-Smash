require 'rails_helper'

feature 'user can add a new food', %Q(

  As a user of Bulk Smash,
  I want to be able to add new food entries
  so that I can create grocery lists
) do

  scenario 'user adds a new food' do

    user = FactoryGirl.create(:user)
    unit = FactoryGirl.create(:pound)
    food = FactoryGirl.create(:chicken)

    visit new_food_path
    fill_in "Name", with: food.name
    select unit.name, from: "Units"

    click_button "Create Food"

    expect(page).to have_content("Successfully Created!")
  end
end
