class FriendshipsController < ApplicationController
  before_action :authenticate_user!

  def send_request
    @request = Friendship.find_or_initialize_by(
      user_id: current_user.id,
      friendee_id: params[:id]
      )

    @request.accepted = false

    try_to_save(@request, "Sent")
  end

  def accept_request
    @request = Friendship.find_or_initialize_by(
      user_id: params[:id],
      friendee_id: current_user.id
      )

    @request.accepted = true

    try_to_save(@request, "Accepted")
  end

  def destroy
    @friendships = current_user.find_friendship_by_friend_id(params[:id])
    @friendships.each { |friendship| friendship.destroy }
    flash[:notice] = "Friend Removed"
    redirect_to current_user
  end

  private

    def try_to_save(request, type)

      if request.save
        redirect_to User.find(params[:id]),
        notice: "Friend Request Successfully #{type}."
      else
        redirect_to User.find(params[:id]),
        notice: "Friend Request Not #{type}!"
      end
    end

    def friendship_params
      params.require(:friendship).permit(
        :user_id,
        :friendee_id,
        :accepted
        )
    end
end
