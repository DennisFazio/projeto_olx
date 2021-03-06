# frozen_string_literal: true
Dir[File.join(File.dirname(__FILE__), "../support/entity/sections/*.rb")].sort.each { |file| require file }

class SearchResult < SitePrism::Page
  sections :list_products, ListProducts, 'div[class*="fnmrjs-1"]'

  def pega_os_x_primeiros_produtos(x)
    count = 0
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

      break if count >= x
    end
    retorno
  end

  def foco_no_produto(num_produto)
    count = 0
    list_products.each do |item|
      if item.has_selector? 'div[class*="fnmrjs-6"]'
        item.descricao.hover
        count += 2
      end

      break if count >= num_produto
    end
  end

  def click_no_produto(num_produto)
    count = 0
    list_products.each do |item|
      if item.has_selector? 'div[class*="fnmrjs-6"]'
        item.descricao.click
        count += 1
      end

      break if count >= num_produto
    end
  end
end
