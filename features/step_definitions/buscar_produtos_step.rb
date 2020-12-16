# frozen_string_literal: true
# encoding: UTF-8

######  DADO  ######
Dado("que estou na home do site da OLX") do
  home.load
end

######  QUANDO  ######
Quando("realizo a busca pelo produto {string}") do |nome_produto|
  home.aceita_cookie
  home.busca_produto(nome_produto)
end

######  ENTÃO  ######
Então("devo visualizar os {int} primeiros resultados") do |num_results|
  @lista_produtos = search_result.pega_os_x_primeiros_produtos(num_results)
  @lista_produtos.each do |produto|
    log("Lista de produtos encontrados")
    log("Nome: #{produto.descricao}")
    log("Valor: #{produto.valor}")
    log("-----------------------------")
  end
  log("Para maiores detalhes olhar o arquivo txt gerado na pasta logs/txt")
end

Então("gravar os resultados visualizados na step anterior em um arquivo txt") do
  arquivo = ArquivosOutput.new
  count = 1
  arquivo.registra_lista_produtos("LISTA DE PRODUTOS")
  arquivo.registra_lista_produtos("----------------------------")
  @lista_produtos.each do |produto|
    arquivo.registra_lista_produtos("PRODUTO #{count}")
    arquivo.registra_lista_produtos("NOME: #{produto.descricao}")
    arquivo.registra_lista_produtos("VALOR DO PRODUTO: #{produto.valor}")
    arquivo.registra_lista_produtos("DATA E HORA DE PLUBLICAÇÃO: #{produto.data_hora}")
    arquivo.registra_lista_produtos("REGIÃO DO VENDEDOR: #{produto.local}")
    arquivo.registra_lista_produtos("----------------------------")
    count += 1
  end
end
