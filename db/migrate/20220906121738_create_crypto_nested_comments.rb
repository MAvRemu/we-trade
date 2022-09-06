class CreateCryptoNestedComments < ActiveRecord::Migration[7.0]
  def change
    create_table :crypto_nested_comments do |t|
      t.references :user, null: false, foreign_key: true
      t.references :crypto_comment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
