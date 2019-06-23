json.extract! order, :id, :title, :description, :address, :price, :created_at, :updated_at
json.url order_url(order, format: :json)
