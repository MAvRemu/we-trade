class UpdateCryptosJob < ApplicationJob
  queue_as :default

  def read_url(url)
    coins_serialized = URI.open(url).read
    return JSON.parse(coins_serialized)
  end

  def perform
    require "open-uri"
    require "json"

    url = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=179"
    i = 1
    fresh_cryptos = []

    9.times do
      fresh_cryptos += read_url("#{url}&page=#{i}")
      i += 1
    end

    # add cryptos that are not yet represented in the database
    unadded_cryptos = fresh_cryptos.reject { |fresh_crypto| Crypto.find_by(id_name: fresh_crypto["id"]) }
    unadded_cryptos.each do |c|
      Crypto.create!(id_name: c["id"], name: c["name"], ticker: c["symbol"], price: c["current_price"], market_cap: c["market_cap"] , rank: c["market_cap_rank"], volume_24h: c["total_volume"], price_1d: c["price_change_percentage_24h"], image_url: c["image"])
    end
    puts "added non represented cryptos" unless unadded_cryptos.empty?

    # update existing cryptos with their latest data
    fresh_cryptos.each do |fresh_crypto|
      crypto = Crypto.find_by(id_name: fresh_crypto["id"])
      crypto.update!(name: fresh_crypto["name"], ticker: fresh_crypto["symbol"], price: fresh_crypto["current_price"], market_cap: fresh_crypto["market_cap"] , rank: fresh_crypto["market_cap_rank"], volume_24h: fresh_crypto["total_volume"], price_1d: fresh_crypto["price_change_percentage_24h"], image_url: fresh_crypto["image"])
    end
    puts "updated all existing cryptos"
  end
end
