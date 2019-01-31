json.extract! product, :id, :name, :description, :article, :created_at, :updated_at
json.url product_url(product, format: :json)
