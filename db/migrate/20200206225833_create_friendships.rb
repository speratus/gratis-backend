class CreateFriendships < ActiveRecord::Migration[6.0]
  def change
    create_table :friendships do |t|
      puts t.class
      t.belongs_to :follower, null: false, foreign_key: true, foreign_key: {to_table: :users}
      t.belongs_to :followee, null: false, foreign_key: true, foreign_key: {to_table: :users}
      t.string :status

      t.timestamps
    end
  end
end
