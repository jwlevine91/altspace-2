class RemoveStuffFromReservations < ActiveRecord::Migration
  def change
    remove_column :reservations, :state, :string
  end
end
