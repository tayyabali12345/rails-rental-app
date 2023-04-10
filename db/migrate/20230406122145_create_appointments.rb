class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.belongs_to :user
      t.belongs_to :property

      t.timestamps
    end
  end
end
