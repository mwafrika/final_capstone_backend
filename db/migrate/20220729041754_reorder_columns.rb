class ReorderColumns < ActiveRecord::Migration[7.0]
  def change
    remove_column :reservations, :location_id, :integer
  end
end
