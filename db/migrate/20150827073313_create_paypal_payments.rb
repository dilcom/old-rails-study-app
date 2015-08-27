class CreatePaypalPayments < ActiveRecord::Migration
  def change
    create_table :paypal_payments do |t|
      t.string :express_token
      t.string :express_payer_id

      t.timestamps null: false
    end
  end
end
