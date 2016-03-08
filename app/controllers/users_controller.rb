class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def index
  	case params[:people]
  	when "reserved"
  		@users = current_user.active_reservations
  	when "requests"
  		@users = current_user.pending_reservation_requests_from
  	when "pending"
  		@users = current_user.pending_reservation_requests_to
  	else
  		@users = User.where.not(id: current_user.id)
  	end
  end

  def show
  	@spaces = Space.all
    @comment = Comment.new
  end

private
def set_user
	@user = User.find_by(username: params[:id])
end

end
