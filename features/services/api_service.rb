def get_token(usuario, senha)
  url = "http://api.site.com.br/user/login"
  @header = { 'content-type': "application/json" }
  @body = { 'userName': "#{usuario}",
            'password': "#{senha}" }
  token = nil

  response = HTTParty.post(url,
                           headers: @header,
                           body: @body)

  if response.code == 200
    body = JSON.parse(response.body)
    token = body["token"]
  else
    puts "Api_get_token retornou sem sucesso"
    puts "Código: #{response.code}"
    puts "Mensagem: #{response.message}"
  end
  token
rescue StandardError => e
  puts "Erro ao chamar a Api_get_token"
  puts "Error message: #{e}"
end

def post_inserir_config(dados)
  url = "http://api.site.com.br/cadastro/item"
  token = get_token(USUARIO, SENHA)

  @header = { 'content-type': "application/json", 'Authorization': "Bearer #{token}" }
  @body = { 'descricao': "#{dados[:descricao]}" }
  response = HTTParty.post(url,
                           headers: @header,
                           body: @body)

  unless response.code == 200
    puts "post_inserir_config retornou sem sucesso"
    puts "Código: #{response.code}"
    puts "Mensagem: #{response.message}"
  end
rescue StandardError => e
  puts "Erro ao chamar a post_inserir_config"
  puts "Error message: #{e}"
end
