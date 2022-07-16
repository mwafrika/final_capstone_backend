class AddRelationshipBetweenTables < ActiveRecord::Migration[7.0]
  def change
      add_foreign_key :reservations, :users, column: :user_id, primary_key: :id, name: :fk_reservations_users
      add_foreign_key :reservations, :locations
      add_foreign_key :reservations, :cars
  end
end
