class CreateProperties < ActiveRecord::Migration[7.0]
  def change
    create_table :properties do |t|
      t.integer :property_type
      t.float :amount, default: 0.0, null: false

      t.timestamps
    end
  end
end
