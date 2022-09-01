class ChangeUpVoteTypeWithUpvotes < ActiveRecord::Migration[7.0]
  def change
    change_column :post_votes, :upvote, :integer, using: "upvote::integer"
  end
end
