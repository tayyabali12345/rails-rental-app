class Addusertoproperty < ActiveRecord::Migration[7.0]
  def change
    add_reference :properties, :user, foreign_key: true
  end
end
