module ChargesHelper
  def upgrade_user(user)
    user.role = 2
    user.save
  end
end
