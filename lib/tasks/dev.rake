namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if not Rails.env.development?
      puts "Esta task só pode ser utilizada em ambiente de desenvolvimento."
      return
    end

    show_spinner("Apagando BD...") { %x(rails db:drop:_unsafe) }
    show_spinner("Criando BD...") { %x(rails db:create) }
    show_spinner("Migrando BD...") { %x(rails db:migrate) }
    %x(rails dev:add_mining_types)
    %x(rails dev:add_coins)
  end

  desc "Cadastra as moedas"
  task add_coins: :environment do
    show_spinner("Populando BD com moedas...") do
      coins = [
        {
          description: "Bitcoin",
          acronym: "BTC",
          url_image: "https://logospng.org/download/bitcoin/logo-bitcoin-256.png",
          mining_type: MiningType.find_by(description: 'Proof of Work')
        },
        {
          description: "Ethereum",
          acronym: "ETH",
          url_image: "https://cdn.iconscout.com/icon/free/png-256/ethereum-1-283135.png",
          mining_type: MiningType.all.sample
        },
        {
          description: "Dash",
          acronym: "DASH",
          url_image: "https://icons.iconarchive.com/icons/cjdowner/cryptocurrency-flat/256/Dash-icon.png",
          mining_type: MiningType.all.sample
        },
        {
          description: "Cardano",
          acronym: "ADA",
          url_image: "https://logospng.org/download/cardano/logo-cardano-256.png",
          mining_type: MiningType.all.sample
        },
        {
          description: "Iota",
          acronym: "IOT",
          url_image: "https://icons.iconarchive.com/icons/cjdowner/cryptocurrency/256/IOTA-icon.png",
          mining_type: MiningType.all.sample
        }
      ]

      coins.each do |coin|
        Coin.find_or_create_by!(coin)
      end
    end
  end

  desc "Cadastra os tipos de mineração"
  task add_mining_types: :environment do
    show_spinner("Populando BD com tipos de mineração...") do
      mining_types = [
        {description: "Proof of Work", acronym: "PoW"},
        {description: "Proof of Stake", acronym: "PoS"},
        {description: "Proof of Capacity", acronym: "PoC"},
      ]

      mining_types.each do |mining_type|
        MiningType.find_or_create_by!(mining_type)
      end
    end
  end

  private
  def show_spinner(msg_start, msg_finish = "Concluído!")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success("(#{msg_finish})")
  end
end
