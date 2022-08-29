class CreatePostVotes < ActiveRecord::Migration[7.0]
  def change
    create_table :post_votes do |t|
      t.boolean :upvote
      t.references :user, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
