class UsersController < ApplicationController
  
  def downgrade_user
    current_user.downgrade
    redirect_to root_path
  end
  
end