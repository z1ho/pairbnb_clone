class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.integer :user_id
      t.integer :listing_id
      t.date :start_date
      t.date  :end_date

      t.timestamps null: false
    end
  end
end
