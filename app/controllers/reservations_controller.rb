class ReservationsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_user, only: [:create]
	before_action :set_reservation, only: [:destroy]

	def create
		@reservation = current_user.request_reservation(@user)
		respond_to do |format|
			format.html {redirect_to users_path, notice: "you've asked to talk!"}
		end
	end

	def destroy
		@reservation.destroy
		respond_to do |format|
			format.html {redirect_to users_path, notice: "you've left this conversation."}
		end
	end

	def accept
		@reservation.accept_reservation
		respond_to do |format|
			format.html {redirect_to users_path, notice: "conversation started!"}
		end
	end

	private
	def set_user
		@user = User.find(params[:user_id])
	end
	def set_reservation
		@reservation = Reservation.find(params[:id])	
	end
end