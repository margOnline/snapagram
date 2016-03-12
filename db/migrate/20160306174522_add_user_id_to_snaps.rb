class AddUserIdToSnaps < ActiveRecord::Migration
  def change
    add_reference :snaps, :user, index: true, foreign_key: true
  end
end
