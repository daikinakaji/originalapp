class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  validates :college_name, presence: true

  has_secure_password
  has_many :blogs

  def User.search(search)
    if search
     where(['college_name LIKE ?', "%#{search}%"])
    else
     all
    end
  end

  
end
