class ChangeCloumnsNotnullAddOrders < ActiveRecord::Migration[6.0]
  def change
    change_column :addresses, :city, :string, null: false
    change_column :addresses, :address, :string, null: false
    change_column :addresses, :phone_number, :string, null: false
  end
end
