class RemoveAndUpdateFields < ActiveRecord::Migration[7.0]
  def change
    remove_column :cars, :price_per_day, :float
    remove_column :cars, :price_per_hour, :float
    remove_column :cars, :number_of_passenger, :integer
    add_column :cars, :price, :float
    rename_table :cars, :bikes
    rename_column :reservations, :car_id, :bike_id
  end
end
