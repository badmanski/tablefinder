class User < ActiveRecord::Base
  include SentientUser

  ROLE_VISITOR = 'visitor'
  ROLE_MEMBER = 'member'
  ROLE_OWNER = 'owner'
  ROLE_ADMIN = 'admin'
  ROLES = [ROLE_VISITOR, ROLE_MEMBER, ROLE_OWNER, ROLE_ADMIN]

  belongs_to :place
  has_many :posts

  validates :name, :email, :password, presence: true
  validates :email, uniqueness: true

  delegate :name, to: :place, prefix: true

  has_secure_password

  def to_s
    email
  end
end
