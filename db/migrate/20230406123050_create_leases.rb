class CreateLeases < ActiveRecord::Migration[7.0]
  def change
    create_table :leases do |t|
      t.belongs_to :user
      t.belongs_to :property
      t.date :start_date, default: -> { 'CURRENT_DATE' }
      t.date :end_date, default: nil

      t.timestamps
    end
  end
end
