class CreateOrgs < ActiveRecord::Migration[5.2]
  def change
    create_table :orgs do |t|
      t.string :name, null: false

      t.timestamps
    end

    add_index :orgs, :name, unique: true
  end
end
