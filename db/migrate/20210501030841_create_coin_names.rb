class CreateCoinNames < ActiveRecord::Migration[6.1]
  def change
    create_table :coin_names do |t|
      t.decimal :price, precision: 10, scale: 2

      t.timestamps
    end
  end
end
