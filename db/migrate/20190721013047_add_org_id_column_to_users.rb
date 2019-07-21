class AddOrgIdColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :org, foreign_key: true
  end
end
