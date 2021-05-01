class CreateCoinNames < ActiveRecord::Migration[6.1]
  def change
    create_table :coin_names do |t|
      t.string :acronym
      t.decimal :price, precision: 10, scale: 2
      t.string :slug

      t.timestamps
    end
  end
end
