class Addcoltoappointments < ActiveRecord::Migration[7.0]
  def change
    add_column :appointments, :booking_date, :date, default: -> { 'CURRENT_DATE' }
  end
end
