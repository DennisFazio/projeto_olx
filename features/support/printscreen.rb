# frozen_string_literal: true

# require "./features/support/entity/email_cartabandonconfig.rb"

class PrintScreen
  def tira_print(nome_arquivo, resultado)
    foto = PrintScreenType.new
    foto.nome = nome_arquivo
    foto.caminho = "logs/screenshots/test_#{resultado}/#{foto.nome}.png"
    print = "logs/screenshots/test_#{resultado}/#{foto.nome}.png"
    Capybara.page.save_screenshot(print)
    $filme.push(foto)
  rescue StandardError => e
    puts "PROBLEMA NA FUNÇÃO tira_print"
    puts e.message
  end
end
