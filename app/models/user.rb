class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  ROLES = %w(member admin)

  def admin?
    @admin ||= has_role?(:admin)
  end

  def admin?
    @member ||= has_role?(:member)
  end
end
