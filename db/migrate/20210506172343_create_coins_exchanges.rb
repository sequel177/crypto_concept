class CreateCoinsExchanges < ActiveRecord::Migration[6.1]
  def change
    create_table :coins_exchanges do |t|
      t.references :coin
      t.string :exchange
      t.string :references

      t.timestamps
    end
  end
end
