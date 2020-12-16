#language: pt

Funcionalidade: Realizar buscas no site da OLX
-- Eu como usuário quero realizar busca por produtos no site da OLX e:
-- -- Exportar os 5 primeiros produtos encontrados
-- -- Exportar e com print o primeiro produto da segunda página

Contexto: Estou no site da OLX
Dado que estou na home do site da OLX

  @cinco_primeiros
  Cenario: Exportar uma lista dos 5 primeiros itens retornados na busca
    Quando realizo a busca pelo produto 'funko pop'
    Então devo visualizar os 5 primeiros resultados
    E gravar os resultados visualizados na step anterior em um arquivo txt

  @primeiro_do_segundo
  Cenario: Exportar e printar o primeiro produto apresentado na segunda página de pesquisa
    Quando realizo a busca pelo produto 'VW Fusca Preto'
    E visualizo a segunda página de resultados
    Então devo exportar e printar o primeiro resultado encontrado na página
  