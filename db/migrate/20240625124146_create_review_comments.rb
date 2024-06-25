class CreateReviewComments < ActiveRecord::Migration[6.1]
  def change
    create_table :review_comments do |t|
      t.text :comment
      t.references :user_id, null: false, foreign_key: true
      t.references :review_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
