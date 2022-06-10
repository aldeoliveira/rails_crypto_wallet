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
    show_spinner("Populando BD...") { %x(rails db:seed) }
  end

  private
  def show_spinner(msg_start, msg_finish = "Concluído!")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success("(#{msg_finish})")
  end
end
