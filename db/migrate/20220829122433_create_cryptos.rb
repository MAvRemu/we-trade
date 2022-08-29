class CreateCryptos < ActiveRecord::Migration[7.0]
  def change
    create_table :cryptos do |t|
      t.string :name
      t.string :ticker
      t.float :price
      t.float :market_cap
      t.integer :rank
      t.float :volume_24h
      t.float :price_1d
      t.float :price_1w
      t.float :price_1m
      t.float :price_1y

      t.timestamps
    end
  end
end
