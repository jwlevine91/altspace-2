class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, presence: true
  validates :username, uniqueness: {case_sensitive: false}
  has_many :comments
  has_many :spaces
  has_many :reservations, dependent: :destroy
  has_many :inverse_reservations, class_name: "Reservation", foreign_key: "requestee_id", dependent: :destroy

  def request_reservation(user_2)
	self.reservations.create(requestee: user_2)  	
  end

  def active_reservations
  	self.reservations.where(state:"active").map(&:requestee) + self.inverse_reservations.where(state:"active").map(&:user)
  end

  def pending_reservation_requests_from
  	self.inverse_reservations.where(state:"pending").map(&:user)
  end

  def pending_reservation_requests_to
  	self.reservations.where(state:"pending").map(&:requestee)
  end

  def reservation_status(user_2)
  	reservation = Reservation.where(user_id: [self.id, user_2.id], requestee_id: [self.id, user_2.id])
  	if reservation.any? == false
  		return "no_reservation"
  	elsif reservation.first.state == "active"
  		return "reserved"
  	elsif reservation.first.user == self
  		return "pending"
  	elsif reservation.first.requestee == self
  		return "requested"
  	end
  end

  def reservation_relation(user_2)
 	Reservation.where(user_id: [self.id, user_2.id], requestee_id: [self.id, user_2.id]).first
  end

end
