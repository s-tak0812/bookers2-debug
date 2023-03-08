class CreateEventMails < ActiveRecord::Migration[6.1]
  def change
    create_table :event_mails do |t|
      t.references :owner_id
      t.references :group
      t.string :title
      t.text :body
      t.timestamps
    end
  end
end
