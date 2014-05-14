class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :avatar
  mount_uploader :avatar, AvatarUploader 
  has_many :viewels
  before_create :set_member

  acts_as_followable

  acts_as_follower

   ROLES =%w[member following]
  def role?(base_role)
  role.nil? ? false : ROLES.index(base_role.to_s) <= ROLES.index(role)
end

private

  def set_member
  	self.role = 'member'
  end


end
