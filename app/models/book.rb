class Book < ApplicationRecord
  belongs_to :user
  has_many :book_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy


  validates :title, presence:true
  validates :body, presence:true, length:{maximum:200}

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  # 検索分岐
  def self.search_for(word, search_part)
    if search_part == "perfect"
      Book.where(title: word)
    elsif search_part == "forward"
      Book.where("title LIKE?", word+"%")
    elsif search_part == "backward"
      Book.where("title LIKE?", "%"+word)
    else
      Book.where("title LIKE?", "%"+word+"%")
    end

  end

end
