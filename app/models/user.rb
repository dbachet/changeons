class User < ActiveRecord::Base
  # rolify
  has_many :links

  # devise :database_authenticatable, :registerable,
         # :recoverable, :rememberable, :trackable, :validatable
  # before_save :add_default_role, if: 'role_ids.empty?'

  # ROLES = %w(member admin)

  # def admin?
  #   @admin ||= has_role?(:admin)
  # end

  # def member?
  #   @member ||= has_role?(:member)
  # end

  # private

  #   def add_default_role
  #     add_role(ROLES.first)
  #   end
end
