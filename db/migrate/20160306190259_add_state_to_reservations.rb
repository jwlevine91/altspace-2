class AddStateToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :state, :string, default: "pending"
  end
end
