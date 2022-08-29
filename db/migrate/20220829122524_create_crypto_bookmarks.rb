class CreateCryptoBookmarks < ActiveRecord::Migration[7.0]
  def change
    create_table :crypto_bookmarks do |t|
      t.references :user, null: false, foreign_key: true
      t.references :crypto, null: false, foreign_key: true

      t.timestamps
    end
  end
end
