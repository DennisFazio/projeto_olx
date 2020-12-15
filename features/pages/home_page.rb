# frozen_string_literal: true

class Home < SitePrism::Page
  element :email_crm, 'input[ng-model="loginCtrl.form.username"]'
  element :senha_crm, 'input[ng-model="loginCtrl.form.password"]'
  element :btn_login, 'button[type="submit"]'

  set_url "/"

  def login
    @usuario_logado = USUARIO["Nomeusuario"]
    @email_logado = USUARIO["username"]
    senha = USUARIO["senha"]
    email_crm.set @email_logado
    senha_crm.set senha
    btn_login.click
  end
end
