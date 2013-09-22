class Post < ActiveRecord::Base

  belongs_to :user
  has_many :comments

  validates :title, :user_id, presence: true

  delegate :name, :email, :place, to: :user, prefix: true
end
