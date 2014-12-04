require 'rails_helper'

feature 'user is told why a new unit was not accepted', %Q(

  As a user of Bulk Smash,
  I want know why my submission for a new unit was not accepted
  so that I can correct my mistake

) do

  scenario 'user adds a new unit incorrectly' do

    user = FactoryGirl.create(:user)
    unit = FactoryGirl.build(:pound)

    visit new_unit_path

    click_button "Create Unit"

    expect_presence_error_for("unit", "name")

    expect(page).to have_content("Could Not Save")
  end
end

def expect_presence_error_for(model, attribute)
  within ".input.#{model}_#{attribute}" do
    expect(page).to have_content "can't be blank"
  end
end
