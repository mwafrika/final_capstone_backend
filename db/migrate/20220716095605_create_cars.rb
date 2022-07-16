class CreateCars < ActiveRecord::Migration[7.0]
  def change
    create_table :cars do |t|
      t.string :make
      t.string :model
      t.text :description
      t.string :image
      t.integer :number_of_passenger
      t.boolean :is_available
      t.float :price_per_hour
      t.float :price_per_day

      t.timestamps
    end
  end
end
