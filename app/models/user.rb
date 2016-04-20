class User < ActiveRecord::Base
  has_many :collaborators
  has_many :wikis, :through => :collaborators
  
  enum role: [:admin, :member, :premium]
  after_initialize :set_default_role
  
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :confirmable
  
  def admin?
    role == "admin"
  end
  
  def member?
    role == "member"
  end
  
  def premium?
    role == "premium"
  end
  
  def set_default_role
    self.role ||= :member
  end
  
  def upgrade
    self.role = 'premium'
    self.save
  end
  
  def downgrade
    self.role = 'member'
    make_wikis_public
    self.save
  end
  
  def make_wikis_public
    self.wikis.each do |w| 
      w.update(private: false)
    end
  end
  
end
