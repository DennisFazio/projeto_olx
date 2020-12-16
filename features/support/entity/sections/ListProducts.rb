# frozen_string_literal: true
class ValuesProducts < SitePrism::Section
  element :atual, 'span[class*="sc-ifAKCX"]', match: :first
  element :anterior, 'span[class*="aoie8y-1"]'
end

class ListProducts < SitePrism::Section
  element :descricao, 'div[class*="fnmrjs-6"]'
  section :valor, ValuesProducts, 'div[class*="fnmrjs-9"]'
  element :data_hora, 'div[class*="fnmrjs-10"]'
  element :local, 'div[class*="fnmrjs-5"]'
end
