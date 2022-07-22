class BikeSerializer
  include JSONAPI::Serializer
  attributes :make, :id, :model, :description,
             :is_available, :price,
             :image, :image_url, :created_at, :updated_at
end
