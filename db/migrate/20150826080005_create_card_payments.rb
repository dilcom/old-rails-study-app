class CreateCardPayments < ActiveRecord::Migration
  def change
    create_table :card_payments do |t|
      t.string :first_name
      t.string :last_name
      t.string :last4
      t.decimal :amount
      t.boolean :success
      t.string :authorization_code

      t.timestamps null: false
    end
  end
end
