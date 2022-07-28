class RemoveLocationTableAddCity < ActiveRecord::Migration[7.0]
  def change
    drop_table :locations, force: :cascade
    add_column :reservations, :city, :string
  end
end
