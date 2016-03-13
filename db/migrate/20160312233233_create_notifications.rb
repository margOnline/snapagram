class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.references :user, index: true, foreign_key: true
      t.references :notified_by, index: true
      t.references :snap, index: true, foreign_key: true
      t.string :identifier
      t.boolean :read
      t.string :notice_type

      t.timestamps null: false
    end
    add_foreign_key :notifications, :users, column: :notified_by_id
  end
end
