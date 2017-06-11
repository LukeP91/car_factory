class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.integer :user_id, null: false, index: true
      t.string :phone_number
      t.date :accepted_at

      t.timestamps
    end
  end
end
