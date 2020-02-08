class CreateMentions < ActiveRecord::Migration[6.0]
  def change
    create_table :mentions do |t|
      t.belongs_to :shoutout, null: false, foreign_key: true, on_delete: :cascade
      t.belongs_to :user, null: false, foreign_key: true, foreign_key: 'recipient_id', on_delete: :cascade

      t.timestamps
    end
  end
end
