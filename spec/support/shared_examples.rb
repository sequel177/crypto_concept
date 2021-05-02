=begin
Rspec.shared_examples 'Sorted_coins' do
  older_coin = create(:coin, created_at: 1.hour.ago)
      recent_coin = create(:coin)
      get '/coins'
      ids = json_data.map { |item| item[:id].to_i }
      expect(ids).to(
        eq([recent_coin.id, older_coin.id])
      )
  end

   older_coin =
        create(:coin, created_at: 1.hour.ago)
      recent_coin = create(:coin)

      expect(described_class.recent).to eq(
        [recent_coin, older_coin]
      )

      recent_coin.update_column(:created_at, 2.hours.ago)

      expect(described_class.recent).to eq(
        [older_coin, recent_coin]
      )
   end
end
=end