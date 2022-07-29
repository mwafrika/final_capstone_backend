class AddUserToLocationAndCars < ActiveRecord::Migration[7.0]
  def change
      add_reference :locations, :user, foreign_key: true
      add_reference :cars, :user, foreign_key: true
  end
end
