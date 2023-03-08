class RenameOwnerIdIdColumnToEventMails < ActiveRecord::Migration[6.1]
  def change
    rename_column :event_mails, :owner_id_id, :user
  end
end
