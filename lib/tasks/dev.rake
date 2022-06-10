namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if not Rails.env.development?
      puts "Esta task só pode ser utilizada em ambiente de desenvolvimento."
    end

    puts %x(rails db:drop:_unsafe)
    puts %x(rails db:create)
    puts %x(rails db:migrate)
    puts %x(rails db:seed)
  end
end
