class Group < ApplicationRecord
  has_many:group_users, dependent: :destroy
  belongs_to :owner, class_name: 'User'
  has_many :users, through: :group_users, source: :user
  has_many :event_mails, dependent: :destroy


  #userがgroupに所属していればtrueを返す
  def user_belonging?(user)
    users.include?(user)
  end


  validates :name, presence:true
  validates :introduction, presence:true

  has_one_attached :image

  def get_image
    (image.attached?) ? image : 'no_image.jpg'
  end

  def includesUser?(user)
    group_users.exists?(user_id: user.id)
  end


end
