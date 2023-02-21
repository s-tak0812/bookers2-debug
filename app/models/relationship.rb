class Relationship < ApplicationRecord
  # 中間モデル
  # belongs_to :仮のcolomn名, class_name: "xxx"でxxxモデルを参照
  belongs_to :follower, class_name: "User"

  belongs_to :followed, class_name: "User"

end
