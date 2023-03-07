class CreateGroupUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :group_users do |t|
      t.integer :user_id
      t.references :group, null: false, foreign_key: true
      t.timestamps
    end
  end
end
