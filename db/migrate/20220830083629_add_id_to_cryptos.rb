class AddIdToCryptos < ActiveRecord::Migration[7.0]
  def change
    add_column :cryptos, :id_name, :string
  end
end
