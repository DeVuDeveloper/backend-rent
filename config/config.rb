require 'cloudinary'

Cloudinary.config_from_url("cloudinary://API_KEY:API_SECRET@CLOUD_NAME")
Cloudinary.config do |config|
  config.secure = true
end