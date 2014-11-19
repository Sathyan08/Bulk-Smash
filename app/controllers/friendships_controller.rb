class FriendshipsController < ApplicationController

  def send_request
    @request = Friendship.find_or_initialize_by(user_id: current_user.id, friendee_id: params[:id])
    @request.accepted = false

    if @request.save
      redirect_to User.find(params[:id]), notice: "Friend Request Successfully Submitted."
    else
      redirect_to User.find(params[:id]), notice: "Friend Request Failed!"
    end
  end

  def accept_request

  end

end