class Book < ApplicationRecord
  belongs_to :user
  has_many :book_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :view_counts

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


  def self.search_tag_for(vol)
    Book.where(tag: vol)
  end


  scope :created_today, -> { where(created_at: Time.zone.now.all_day) }
  scope :created_yesterday, -> { where(created_at: 1.day.ago.all_day)}
  scope :created_last_7_days, -> { where(created_at: Time.current.ago(6.days).beginning_of_day...Time.current.end_of_day) }
  scope :created_before_last_week, -> { where(created_at: 2.week.ago.beginning_of_day..1.week.ago.end_of_day)}

  scope :created_2days_ago, -> { where(created_at: 2.day.ago.all_day)}
  scope :created_3days_ago, -> { where(created_at: 3.day.ago.all_day)}
  scope :created_4days_ago, -> { where(created_at: 4.day.ago.all_day)}
  scope :created_5days_ago, -> { where(created_at: 5.day.ago.all_day)}
  scope :created_6days_ago, -> { where(created_at: 6.day.ago.all_day)}

end
