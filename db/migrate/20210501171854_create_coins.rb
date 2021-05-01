class CreateCoins < ActiveRecord::Migration[6.1]
  def change
    create_table :coins do |t|
      t.string :name
      t.string :ticker
      t.float :price
      t.string :slug

      t.timestamps
    end
  end
end
