class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :name
      t.string :country
      t.string :state
      t.string :city
      t.string :address_line_1
      t.string :address_line_2
      t.string :postal_code
      t.string :phone

      t.timestamps null: false
    end
  end
end
