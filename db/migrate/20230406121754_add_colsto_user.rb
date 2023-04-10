class AddColstoUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string, default: "", null: false
    add_column :users, :user_type, :int
  end
end
