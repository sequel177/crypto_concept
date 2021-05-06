class CreateCoinsExchanges < ActiveRecord::Migration[6.1]
  def change
    create_table :coins_exchanges do |t|
      t.references :coin, null: false, foreign_key: true
      t.string :exchange
      t.string :references

      t.timestamps
    end
  end
end
