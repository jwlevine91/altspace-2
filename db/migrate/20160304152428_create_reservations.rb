class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.integer :user_id
      t.integer :requestee_id
      t.integer :space_id
      t.string :state

      t.timestamps null: false
    end
  end
end
