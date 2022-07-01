class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher

  devise :database_authenticatable, :registerable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  has_one_attached :image, dependent: :destroy
  has_many :reservations, dependent: :destroy
  has_many :cars, dependent: :destroy
 

  # validates :name, presence: true, length: { maximum: 20 }

  def jwt_payload
    super.merge('foo' => 'bar')
  end

  def image_url
    Rails.application.routes.url_helpers.url_for(image) if image.attached?
  end
end
