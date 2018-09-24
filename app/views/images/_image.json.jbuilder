json.extract! image, :id, :name, :number_bands, :spectrum, :bandwidth, :year, :description, :created_at, :updated_at
json.url image_url(image, format: :json)
