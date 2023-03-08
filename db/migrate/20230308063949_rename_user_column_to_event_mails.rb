class RenameUserColumnToEventMails < ActiveRecord::Migration[6.1]
  def change
    rename_column :event_mails, :user, :user_id
  end
end
