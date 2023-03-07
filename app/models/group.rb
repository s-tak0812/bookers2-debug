class Group < ApplicationRecord
  validates :name, presence:true
  validates :introduction, presence:true

  has_one_attached :image
end
