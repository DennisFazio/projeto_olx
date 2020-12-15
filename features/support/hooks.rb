# frozen_string_literal: true

PRINT = PrintScreen.new
Before do |scenario|
  $filme = [] if $filme == nil
  pega_steps(scenario)
end

After do |scenario|
  nome_cenario = scenario.name.gsub(/\s+/, "_").tr("/#", "_c")
  step = pega_nome_step
  screenshot_name = "cenario_#{nome_cenario}_step_#{step}"
  begin
    if scenario.failed?
      PrintScreen.new.tira_print(screenshot_name.downcase, "falhou")
    else
      PrintScreen.new.tira_print(screenshot_name.downcase, "passou")
    end
    # add_browser_logs
    anexa_print
  rescue StandardError
    raise "Erro ao gerar screenshots"
  end
end

AfterStep do
  anexa_print if $filme != []
  @count += 1
end

def add_browser_logs
  time_now = Time.now
  current_url = Capybara.current_url.to_s
  logs = page.driver.browser.manage.logs.get(:browser).map { |line| [line.level, line.message] }
  logs.reject! { |line| %w[WARNING INFO].include?(line.first) }
  attach(
    time_now.strftime("%Y-%m-%d-%H-%M-%S" + "\n") + ("Current URL: " + current_url + "\n") + logs.join("\n"),
    "text/plain"
  )
end

def pega_steps(scenario)
  @count = 0
  @steps = []
  @steps = scenario.test_steps.map(&:text)
  @steps.delete_if { |text| text == "AfterStep hook" }
end

def pega_nome_step
  @nome_step = @steps[@count - 1]
  @nome_step = @nome_step.gsub(/[^A-Za-z0-9 ]/, "")
  @nome_step = @nome_step.tr(" ", "_")
  @nome_step
end

def anexa_print
  $filme.each do |row|
    attach(row.caminho, "image/png")
  end
  $filme.clear
rescue StandardError => e
  log("PROBLEMA NA FUNÇÃO anexa_print")
  log(e.message)
end

at_exit do
  ReportBuilder.configure do |config|
    config.json_path = "logs/json/report.json"
    config.report_path = "logs/html/Automacao_Dennis_Fazio_report"
    config.report_types = %i[html]
    config.report_tabs = %w[Overview Features Scenarios Errors]
    config.report_title = "Projeto de Automacao Dennis Fazio"
    config.compress_images = false
    config.additional_info = {
      "Projeto:" => "Projeto de Automacao Dennis Fazio",
      "Ambiente" => AMBIENTE.upcase,
      "Data de Geracao" => DateTime.now.strftime("%d/%m/%Y - %H:%M:%S"),
    }
    config.color = "black"
  end
  ReportBuilder.build_report
end
