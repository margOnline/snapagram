class CreateSnaps < ActiveRecord::Migration
  def change
    create_table :snaps do |t|
      t.string :caption

      t.timestamps null: false
    end
  end
end
