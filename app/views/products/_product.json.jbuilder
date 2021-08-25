json.extract! product, :id, :title, :category, :description, :price, :created_at, :updated_at
json.url product_url(product, format: :json)
