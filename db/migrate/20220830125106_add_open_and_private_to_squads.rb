class AddOpenAndPrivateToSquads < ActiveRecord::Migration[7.0]
  def change
    add_column :squads, :private, :boolean, default: false
    add_column :squads, :open, :boolean, default: true
  end
end
