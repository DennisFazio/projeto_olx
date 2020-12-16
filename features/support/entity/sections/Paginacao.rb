# frozen_string_literal: true
class Paginacao < SitePrism::Section
  element :btn_proximo, 'span[class*="sc-1bofr6e-1"]', text: "Próxima pagina"
  element :btn_ultima_pagina, 'span[class*="sc-1bofr6e-1"]', text: "Última pagina"
end
