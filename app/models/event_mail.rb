class EventMail < ApplicationRecord
  belongs_to:group
  belongs_to:user

  validates :title, presence:true
  validates :body, presence:true
end
