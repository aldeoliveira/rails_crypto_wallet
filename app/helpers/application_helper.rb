module ApplicationHelper
  def data_br(data_us)
    data_us.strftime("%d/%m/%Y")
  end

  def nome_aplicacao
    "CRYPTO WALLET APP"
  end

  def language
    if I18n.locale == :en
      'American English'
    elsif I18n.locale == :'pt-BR'
      'Português Brasileiro'
    else
      'None'
    end
  end

  def ambiente_rails
    if Rails.env.development?
      "desenvolvimento"
    elsif Rails.env.production?
      "produção"
    else
      "teste"
    end
  end
end
