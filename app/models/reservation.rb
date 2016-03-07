class Reservation < ActiveRecord::Base
	belongs_to :user
	belongs_to :requestee, class_name: "User"

	def accept_reservation
		self.update_attributes(state:"active")
	end

	def deny_reservation
		self.destroy
	end

	def cancel_reservation
		self.destroy
	end
end
