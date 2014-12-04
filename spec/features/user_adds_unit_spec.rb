require 'rails_helper'

feature 'user can add a new unit', %Q(

  As a user of Bulk Smash,
  I want to be able to add new units
  so that I can make sure it is adding up the grocery lists properly

) do

  scenario 'user adds a new unit' do

    user = FactoryGirl.create(:user)
    unit = FactoryGirl.build(:pound)

    visit new_unit_path
    fill_in "Name", with: unit.name

    click_button "Create Unit"

    expect(page).to have_content("Successfully Created!")
  end
end
