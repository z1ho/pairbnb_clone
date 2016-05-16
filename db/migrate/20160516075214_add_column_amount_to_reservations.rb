class AddColumnAmountToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :amount, :integer
  end
end
