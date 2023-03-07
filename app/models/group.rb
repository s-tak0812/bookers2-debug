class Group < ApplicationRecord
  has_many:group_users, dependent: :destroy
  has_many:users, through: :group_users

  #userがgroupに所属していればtrueを返す
  def user_belonging?(user)
    users.includee?(user)
  end


  validates :name, presence:true
  validates :introduction, presence:true

  has_one_attached :image

  def get_image
    (image.attached?) ? image : 'no_image.jpg'
  end

end
