class Post < ApplicationRecord

  validates_presence_of :content
  belongs_to :user

  has_many :likes, :dependent => :destroy
  has_many :liked_users, :through => :likes, :source => :user

  def find_like(user)
    if user
      self.likes.where( :user_id => user.id ).first
    else
      nil
    end
  end

end
