class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy
  has_many :book_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  # 中間モデル
  #1⃣ has_many :associationが繋がっているtable名(適当)-A,class_name:"中間table名",foreign_key:"外部key"
  #2⃣ has_many :架空のtable名(.で繋げられる),through::-A,source::参照するcolumn名
  # 1⃣-2⃣
  # 1⃣
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  # 2⃣
  has_many :followings, through: :relationships, source: :followed
  has_many :followers, through: :reverse_of_relationships, source: :follower

  has_one_attached :profile_image

  validates :name, length: { minimum: 2, maximum: 20 }, uniqueness: true
  validates :introduction, length: {maximum: 50 }


  def get_profile_image
    (profile_image.attached?) ? profile_image : 'no_image.jpg'
  end

  # followしたときの処理
  def follow(user_id)
    relationships.create(followed_id: user_id)
  end

  # followを外すときの処理
  def unfollow(user_id)
    relationships.find_by(followed_id: user_id).destroy
  end

  # followしているかの判定
  def following?(user)
    followings.include?(user)
  end

end
