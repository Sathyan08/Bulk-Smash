require 'rails_helper'

feature 'ussr can unfriend someone on his or her own friendslist', %Q(
    As a User of Bulk Smash,
    I want to be able to unfriend someone who I either cannot or will not purchase bulk goods with
    so that I can focus on making shared purchases that are feasible.

  ) do

    scenario 'user unfriends a friend' do
      user = FactoryGirl.create(:user)
      friendee = FactoryGirl.create(:friendee)

      friendship = FactoryGirl.build(:friendship)
      friendship.user = user
      friendship.friendee = friendee
      friendship.accepted = true
      friendship.save

      visit root_path
      click_link 'Sign in'

      fill_in 'Email', with: friendee.email
      fill_in 'Password', with: friendee.password
      click_button 'Log in'

      visit users_path

      click_link friendee.email

      click_link 'Remove'

      expect(page).to have_content("Friend Removed")
    end
  end
