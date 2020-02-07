class CreateGroupMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :group_members do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :friend_group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
