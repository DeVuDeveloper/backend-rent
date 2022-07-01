class UserSerializer
  include FastJsonapi::ObjectSerializer
  include JSONAPI::Serializer
  attributes :name, :email, :role, :image, :image_url, :created_at, :updated_at
  attribute :created_date do |user|
    user&.created_at&.strftime('%d/%m/%Y')
  end
end
