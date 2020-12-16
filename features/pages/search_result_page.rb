# frozen_string_literal: true
Dir[File.join(File.dirname(__FILE__), "../support/entity/sections/*.rb")].sort.each { |file| require file }

class SearchResult < SitePrism::Page
  sections :list_products, ListProducts, 'div[class*="fnmrjs-1"]'

  def pega_os_x_primeiros_produtos(x)
    count = 0
    propaganda = 0
    retorno = []
    list_products.each do |item|
      puts "Procurando o produto #{count + 1}"
      if item.has_selector? 'div[class*="fnmrjs-6"]'
        obj = ListProductsType.new
        obj.descricao = item.descricao.text
        obj.valor = item.valor.atual.text
        obj.data_hora = item.data_hora.text
        obj.local = item.local.text
        retorno.push(obj)
        puts "Achei o produto #{count + 1}"
        count += 1
      end
      propaganda += 1

      break if count >= x
    end
    retorno
  end
end
