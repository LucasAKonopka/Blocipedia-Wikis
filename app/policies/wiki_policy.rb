class WikiPolicy < ApplicationPolicy
  
  def index?
    true
  end
  
  def create?
    true
    #user.present?
  end
  
  def update?
    user.present? && user == wiki.user
  end
  
  def destroy?
    user.present && (user == wiki.user || user.admin?) 
  end
  
  private
  
  def wiki
    record
  end
end