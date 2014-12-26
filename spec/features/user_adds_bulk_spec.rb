require 'rails_helper'

feature 'user can add a new bulk quantity and its price', %Q(

  As a user of Bulk Smash!,
  I want to be able to add new bulk purchases
  so that I can add more options for bulk purchases

) do

  scenario 'user adds a new bulk purchasing unit' do
    bulk = FactoryGirl.build(:bulk)
    food = FactoryGirl.create(:food)

    visit new_bulk_path

    select food.name, from: "Food"
    fill_in "Amount", with: bulk.amount
    fill_in "Price", with: bulk.price

    click_button "Create Bulk"

    expect(page).to have_content("Successfully Created!")
  end
end
