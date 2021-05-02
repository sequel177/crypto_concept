class RemoveSlugFromCoins < ActiveRecord::Migration[6.1]
  def change
  	remove_column :coins, :slug
  end
end
