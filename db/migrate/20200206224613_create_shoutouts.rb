class CreateShoutouts < ActiveRecord::Migration[6.0]
  def change
    create_table :shoutouts do |t|
      t.string :content
      t.belongs_to :creator, null: false, foreign_key: true
      t.string :visibility

      t.timestamps
    end
  end
end
