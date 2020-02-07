class CreateMentions < ActiveRecord::Migration[6.0]
  def change
    create_table :mentions do |t|
      t.belongs_to :shoutout, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true, foreign_key: 'recipient_id'

      t.timestamps
    end
  end
end
