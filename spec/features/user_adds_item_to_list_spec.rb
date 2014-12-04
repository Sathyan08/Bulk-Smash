require 'rails_helper'

feature 'user can add a new items to list', %Q(

  As a user of Bulk Smash,
  I want to be able to add new items to my list
  so that I can create grocery lists
) do

  scenario 'user adds a new item to his or her list' do

    list = FactoryGirl.create(:list)
    unit = FactoryGirl.create(:pound)
    food = FactoryGirl.create(:food)

    visit root_path
    click_link 'Sign in'

    fill_in 'Email', with: list.user.email
    fill_in 'Password', with: list.user.password
    click_button 'Log in'

    visit user_path(list.user)

    click_link list.name

    select food.name, from: "Food"
    fill_in "Amount", with: 10

    click_button "Create List item"

    expect(page).to have_content("Successfully Created!")
  end
end
