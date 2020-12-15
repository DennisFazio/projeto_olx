# frozen_string_literal: true

require "tiny_tds"

# Dados CMS
class Db_Tabela
  def initialize
    servidor = "homolog"
    db = "#{AMBIENTE.capitalize}"
    @banco = TinyTds::Client.new host: servidor, port: 1433, database: db
  end

  def select_total_dia_tabela
    results = @cms.execute("SELECT * from tabela")
    retorno = []
    results.each do |row|
      # obj = TotalDisparosDia.new
      obj.data = row["data"]
      obj.total = row["Quantity"]
      retorno.push(obj)
    end
    retorno
  rescue TinyTds::Error => e
    puts "Erro na função select_total_dia_tabela"
    puts "Error message: #{e}"
  ensure
    @banco.close
  end
end
