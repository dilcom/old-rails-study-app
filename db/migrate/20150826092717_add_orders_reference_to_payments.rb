class AddOrdersReferenceToPayments < ActiveRecord::Migration
  def change
    add_reference :orders, :payment, polymorphic: true, index: true
  end
end
