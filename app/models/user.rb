class User
  include Mongoid::Document
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  ROLES = %w[user manager]

  field :name, :type => String
  field :role, :type => String, :default => 'user'

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validate :name, :role, :presence => true
  validate :role, :inclustion => ROLES
  validate :name, :uniqueness => true

  def can_manage?
    role == 'manager'
  end

end
