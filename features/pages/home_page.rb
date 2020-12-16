# frozen_string_literal: true
Dir[File.join(File.dirname(__FILE__), "../support/entity/sections/*.rb")].sort.each { |file| require file }

class Home < SitePrism::Page
  element :input_search, "#searchtext"
  element :btn_search, ".searchSubmitBtn"
  element :btn_aceita_cookies, "#cookie-notice-ok-button"
  section :paginacao, Paginacao, 'div[class*="sc-hmzhuo fFyjgz sc-jTzLTM"]'

  set_url ""

  def busca_produto(produto)
    input_search.set produto
    btn_search.click
  end

  def aceita_cookie
    if page.has_selector? "#cookie-notice-box", wait: 2 == true
      btn_aceita_cookies.click
    end
  end

  def muda_para_pagina(num_pagina)
    paginacao.find('a[class="sc-1koxwg0-1 bUiXqk"]', text: num_pagina.to_s)
  end
end
