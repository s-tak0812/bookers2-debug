class EventMail < ApplicationRecord
  belongs_to:group

  validates :title, presence:true
  validates :body, presence:true
end
