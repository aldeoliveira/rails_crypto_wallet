namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if not Rails.env.development?
      puts "Esta task só pode ser utilizada em ambiente de desenvolvimento."
    end

    spinner = TTY::Spinner.new("[:spinner] Apagando BD...")
    spinner.auto_spin
    %x(rails db:drop:_unsafe)
    spinner.success("Concluído!")

    spinner = TTY::Spinner.new("[:spinner] Criando BD...")
    spinner.auto_spin
    %x(rails db:create)
    spinner.success("Concluído!")

    spinner = TTY::Spinner.new("[:spinner] Migrando o BD...")
    spinner.auto_spin
    %x(rails db:migrate)
    spinner.success("Concluído!")

    spinner = TTY::Spinner.new("[:spinner] Populando o BD...")
    spinner.auto_spin
    %x(rails db:seed)
    spinner.success("Concluído!")
  end
end
