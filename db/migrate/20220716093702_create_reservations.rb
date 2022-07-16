class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.integer :reservation_number
      t.date :date_reserved
      t.integer :user_id
      t.integer :location_id
      t.integer :car_id

      t.timestamps
    end
  end
end
