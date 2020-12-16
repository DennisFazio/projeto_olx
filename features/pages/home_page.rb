# frozen_string_literal: true

class Home < SitePrism::Page
  element :input_search, "#searchtext"
  element :btn_search, ".searchSubmitBtn"
  element :btn_aceita_cookies, "#cookie-notice-ok-button"

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
end
