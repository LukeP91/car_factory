class CreateAvailabilities < ActiveRecord::Migration[5.0]
  def change
    create_table :availabilities do |t|
      t.integer :user_id, index: true
      t.date :day_off, null: false

      t.timestamps
    end
  end
end
