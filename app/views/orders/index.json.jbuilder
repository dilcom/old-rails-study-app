json.array!(@orders) do |order|
  json.extract! order, :id, :name, :country, :state, :city, :address_line_1, :address_line_2, :postal_code, :phone
  json.url order_url(order, format: :json)
end
