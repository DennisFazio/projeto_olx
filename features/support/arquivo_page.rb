# frozen_string_literal: true

class ArquivosOutput
  def cria_arquivo(caminho_arquivo, nome_arquivo)
    nome_arq = nome_arquivo.gsub(/\s+/, "_").tr("/#", "_c")
    arquivo = File.new(Dir.pwd + "#{caminho_arquivo}#{nome_arq}.txt", "a+")
    arquivo.close
    arquivo
  end

  def registra_lista_produtos(texto)
    if $caminho_arquivo_log.nil?
      # Cria o nome do arquivo
      nome_arquivo = "lista_produtos_#{Time.now.year}_#{Time.now.month}_#{Time.now.day}_#{Time.now.hour}"
      # cria o arquivo
      $caminho_arquivo_log = cria_arquivo("/Logs/txt/", nome_arquivo)
    end
    # Abre o arquivo criado
    arquivo = File.new($caminho_arquivo_log, "a+")

    # Grava os dados no arquivo
    arquivo.puts texto
    arquivo.close unless arquivo.closed?
    # binding.pry
  end
end
