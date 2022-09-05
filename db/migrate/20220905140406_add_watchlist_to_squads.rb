class AddWatchlistToSquads < ActiveRecord::Migration[7.0]
  def change
    add_column :squads, :watchlist, :integer
  end
end
