class CreateCryptoRatings < ActiveRecord::Migration[7.0]
  def change
    create_table :crypto_ratings do |t|
      t.integer :rating
      t.references :user, null: false, foreign_key: true
      t.references :crypto, null: false, foreign_key: true

      t.timestamps
    end
  end
end
