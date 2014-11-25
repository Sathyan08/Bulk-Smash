require 'rails_helper'

feature 'user can navigate to his or her own show page and accept a friend request', %Q(

  As a user of Bulk Smash!,
  I want to be able to accept friend requests
  so that I can see which of my friends I can split bulk goods with

) do

  scenario 'user accepts friend request' do
    user = FactoryGirl.create(:user)
    friendee = FactoryGirl.create(:friendee)

    friendship = FactoryGirl.create(:friendship)



    expect(page).to have_content("Friend Request Successfully Accepted.")
  end
end
