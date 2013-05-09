class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  after_create :add_default_role

  ROLES = %w(member admin)

  def admin?
    @admin ||= has_role?(:admin)
  end

  def member?
    @member ||= has_role?(:member)
  end

  private

    def add_default_role
      if role_ids.empty?
        add_role(ROLES.first)
      end
    end
end
