require 'rails_helper'

feature 'user is warned when he or she adds a duplicate food', %Q(

  As a user of Bulk Smash,
  I want to be warned when I try to add a duplicate food
  so that I can correct my mistake
) do

  scenario 'user adds a new food' do

    user = FactoryGirl.create(:user)
    unit = FactoryGirl.create(:pound)
    food = FactoryGirl.create(:food)

    visit new_food_path
    fill_in "Name", with: food.name
    select unit.name, from: "Unit"

    click_button "Create Food"

    within ".input.food_name" do
      expect(page).to have_content "has already been taken"
    end

    expect(page).to have_content("Could Not Save")
  end
end
