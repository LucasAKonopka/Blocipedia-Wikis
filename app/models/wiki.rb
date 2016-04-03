class Wiki < ActiveRecord::Base
  belongs_to :user
  default_scope { order('updated_at desc') }
  
  scope :free, -> { where(private: false) }
  scope :not_private, -> (user) { user.premium? ? all : free }
    
  
  
  
  
end
