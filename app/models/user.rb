class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,      :recoverable, :rememberable, :trackable, :validatable

  ROLES=%w[admin]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :role

  def gravatar_image
    q = Digest::MD5.hexdigest(self.email)
    "http://www.gravatar.com/avatar/#{q}?s=150"
  end

  def to_s
    self.email
  end
end
