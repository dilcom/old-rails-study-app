class AddOrdersPurchasedAtAndIpColumns < ActiveRecord::Migration
  def change
    add_column :orders, :purchased_at, :timestamp
    add_column :orders, :ip, :string
  end
end
