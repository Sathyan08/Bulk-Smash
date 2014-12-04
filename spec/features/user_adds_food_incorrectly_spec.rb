require 'rails_helper'

feature 'user can add a new food incorrectly', %Q(

  As a user of Bulk Smash,
  I want to be warned when I incorrectly try to add a new food entry
  so that I can correct my mistakes
) do

  scenario 'user adds a new food incorrectly' do

    user = FactoryGirl.create(:user)
    unit = FactoryGirl.create(:pound)
    food = FactoryGirl.build(:food)

    visit new_food_path

    click_button "Create Food"

    expect_presence_error_for("food", "name") #note, this method is defined in the add unit incorrectly test file.

    expect(page).to have_content("Could Not Save")
  end
end
