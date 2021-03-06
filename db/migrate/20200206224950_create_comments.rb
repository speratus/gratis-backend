class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :content
      t.belongs_to :user, null: false, foreign_key: true, foreign_key: {to_table: :users}, on_delete: :cascade
      t.belongs_to :shoutout, null: false, foreign_key: true, on_delete: :cascade

      t.timestamps
    end
  end
end
