module UsersHelper
	def reservation_buttons(user)
		case current_user.reservation_status(user)
		when "reserved"
			link_to "Close Conversation", reservation_path(current_user.reservation_relation(user)), method: :delete
		when "pending"
			link_to "Nevermind", reservation_path(current_user.reservation_relation(user)), method: :delete
		when "requested"
			accept = link_to "Yes, Let's Talk", accept_reservation_path(current_user.reservation_relation(user)), method: :put
			deny = link_to "Ignore", reservation_path(current_user.reservation_relation(user)), method: :delete
			accept + " " + deny
		when "no_reservation"
			link_to "Let's Talk", reservations_path(user_id: user.id), method: :post
		end		
	end
end
