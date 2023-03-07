class GroupUser < ApplicationRecord
  belongs_to:group
  belongs_to:user

  validates :user_id, presence:true
  validates :group_id, presence:true
  # 同じuserが同じgroupに複数回参加をすることを防ぐ
  validates :user_id, uniqueness: { scope: :group_id }
  # 同じgroupが同じuserに複数回参加をすることを防ぐ
  validates :group_id, uniqueness: { scope: :user_id }
end
