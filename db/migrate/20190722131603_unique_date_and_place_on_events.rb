class UniqueDateAndPlaceOnEvents < ActiveRecord::Migration[5.2]
  def change
    add_index :events, [:place_id, :date], unique: true
  end
end
