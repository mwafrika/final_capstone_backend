class CarSerializer
  include JSONAPI::Serializer
  attributes :make, :id, :model, :description, :number_of_passenger, 
   :is_available, :price_per_hour, :price_per_day, 
  :image, :image_url, :created_at, :updated_at
end
