class Order < ActiveRecord::Base
	has_many :cart_items
	validates_associated :cart_items
	validates :name, :country, :state, :city, :address_line_1, :postal_code,
	  presence: true, length: { minimum: 2 }
end