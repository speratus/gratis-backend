class CreateCommentLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :comment_likes do |t|
      t.belongs_to :comment, null: false, foreign_key: true, on_delete: :cascade
      t.belongs_to :user, null: false, foreign_key: true, on_delete: :cascade

      t.timestamps
    end
  end
end
