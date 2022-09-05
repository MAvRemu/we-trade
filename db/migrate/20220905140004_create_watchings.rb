class CreateWatchings < ActiveRecord::Migration[7.0]
  def change
    create_table :watchings do |t|
      t.references :crypto, null: false, foreign_key: true
      t.references :watchlist, null: false, foreign_key: true
      t.timestamps
    end
  end
end
