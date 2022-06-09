# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Cadastrando as moedas..."

Coin.create!(
  description: "Bitcoin",
  acronym: "BTC",
  url_image: "https://logospng.org/download/bitcoin/logo-bitcoin-256.png"
)

Coin.create!(
  description: "Ethereum",
  acronym: "ETH",
  url_image: "https://cdn.iconscout.com/icon/free/png-256/ethereum-1-283135.png"
)

Coin.create!(
  description: "Dash",
  acronym: "DASH",
  url_image: "https://icons.iconarchive.com/icons/cjdowner/cryptocurrency-flat/256/Dash-icon.png"
)

Coin.create!(
  description: "Cardano",
  acronym: "ADA",
  url_image: "https://logospng.org/download/cardano/logo-cardano-256.png"
)

Coin.create!(
  description: "Iota",
  acronym: "IOT",
  url_image: "https://icons.iconarchive.com/icons/cjdowner/cryptocurrency/256/IOTA-icon.png"
)

puts "Moedas cadastradas com sucesso!"
