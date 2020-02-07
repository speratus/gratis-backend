class CreateShoutouts < ActiveRecord::Migration[6.0]
  def change
    create_table :shoutouts do |t|
      t.string :content
      t.belongs_to :user, null: false, foreign_key: true, foreign_key: 'creator_id'
      t.string :visibility

      t.timestamps
    end
  end
end
