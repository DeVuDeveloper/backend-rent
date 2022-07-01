class CarSerializer
  include JSONAPI::Serializer
  attributes :id, :car_model, :car_type, :price_per_day, :transmission, :description, :user_id, :image, :image_url, :created_at,
             :updated_at
end
