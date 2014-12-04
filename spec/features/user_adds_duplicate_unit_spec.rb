require 'rails_helper'

feature 'user is told why a new unit was not accepted when it is because a unit with that name already exists', %Q(

  As a user of Bulk Smash,
  I want know why my submission for a new unit was not accepted when I try to add a duplicate unit
  so that I can correct my mistake

) do

  scenario 'user adds a new unit incorrectly' do

    user = FactoryGirl.create(:user)
    unit = FactoryGirl.create(:pound)

    visit new_unit_path

    fill_in "Name", with: unit.name

    click_button "Create Unit"

    within ".input.unit_name" do
      expect(page).to have_content "has already been taken"
    end

    expect(page).to have_content("Could Not Save")
  end
end
