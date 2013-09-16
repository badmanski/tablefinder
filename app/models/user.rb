class User < ActiveRecord::Base
  belongs_to :place

  validates :name, :email, :place_id, :password, presence: true
  validates :name, :email, uniqueness: true

  has_secure_password
end
