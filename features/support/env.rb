# frozen_string_literal: true

require "active_support/all"
require "capybara"
require "capybara/cucumber"
require "capybara/rspec"
require "selenium-webdriver"
require "site_prism"
require "pry"
require "report_builder"
require "httparty"
require_relative "page_helper.rb"

##### VARIÁVEIS DE CONFIGURAÇÃO #####
AMBIENTE = ENV["AMBIENTE"]
World(PageObjects)

##### ARQUIVOS CARREGADOS #####
CONFIG = YAML.load_file(Dir.pwd + "/features/support/generators/fixtures/ambientes.yml") # Dir.pwd procura em toda raiz do projeto (Mais abrangente)

##### CONFIG CAPYBARA #####
Capybara.configure do |config|
  config.default_driver = :selenium_chrome #:chrome # :selenium_chrome_headless ou :selenium_chrome
  config.javascript_driver = :selenium_chrome
  config.app_host = CONFIG[AMBIENTE]
  config.default_max_wait_time = 15
  Capybara.page.driver.browser.manage.window.maximize
  config.automatic_reload = true
end
