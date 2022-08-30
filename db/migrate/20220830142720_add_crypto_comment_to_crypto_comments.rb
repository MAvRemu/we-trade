class AddCryptoCommentToCryptoComments < ActiveRecord::Migration[7.0]
  def change
    add_reference :crypto_comments, :crypto_comment, foreign_key: true
  end
end
