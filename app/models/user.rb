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
  validates :place_id, presence: true, if: :owner?
  validates :place_id, presence: true, if: :member?
  validates :place_id, absence: true, if: :admin?
  validates :place_id, absence: true, if: :visitor?

  delegate :name, to: :place, prefix: true

  has_secure_password

  def to_s
    email
  end

  def admin?
    role == ROLE_ADMIN
  end

  def owner?
    role == ROLE_OWNER
  end

  def member?
    role == ROLE_MEMBER
  end

  def visitor?
    role == ROLE_VISITOR
  end

  def access_level
    case role
    when ROLE_ADMIN
      return 4
    when ROLE_OWNER
      return 3
    when ROLE_MEMBER
      return 2
    else
      return 1
    end
  end
end
