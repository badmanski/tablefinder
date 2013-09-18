class Place < ActiveRecord::Base
  has_many :users
  accepts_nested_attributes_for :users, allow_destroy: true

  validates :name, :email, :address, presence: true
  validates :name, :email, uniqueness: true

  def to_s
    name
  end
end
