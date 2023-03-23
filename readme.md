Teste de automação web com Ruby

Ruby
https://rubyinstaller.org/downloads/

RubyGems
https://rubygems.org/


1. Criar uma pasta local para o projeto

```
Acessar pasta criada e executar o seguinte comando no terminal:

  cucumber --init
```

Será criada a seguinte estrutura padrão:  

```
╰─➤  cucumber --init
  |- 📁 features
  |   |- 📁 step_definitions
  |   |- 📁 support
  |          |- 📑 env.rb
  |       
```

- step_definitions - pasta onde são executados os testes
- support - pasta disponilizada para configurações
- env.rb - arquivo de configurações de ambiente do projeto

```
Acessar a pasta raiz do projeto no terminal e rodar o comando:

  gem install bundler
```

2. Criar o arquivo *Gemfile* na pasta raiz. Nesse arquivo, indico para o ruby onde deve buscar as gem necessárias para o projeto.

```ruby
source "http://rubygems.org/"
gem 'cucumber', '~> 8.0'
gem 'capybara', '~> 3.38'
gem 'selenium-webdriver', '~> 4.8', '>= 4.8.1'
gem 'rspec', '~> 3.12'
gem 'site_prism', '~> 3.7', '>= 3.7.3'
```

```
Rodar o comando:

  bundler install
```

3. Adicionar os requires no arquivo *env.rb* e configurar o Capybara

```ruby
require 'capybara'
require 'capybara/cucumber'
require 'capybara/rspec'
require 'site_prism'
require 'rspec/expectations'

Capybara.configure do |config|
  config.default_driver = :selenium_chrome
  config.app_host = 'http://www.linkedin.com/'
  config.default_max_wait_time = 5
end 
```

4. Criar as pastas *bdd* e *pages* dentro da pasta *features*.
   Crio o arquivo *login.feature* dentro da pasta *bdd*, o arquivo *login.page.rb* na pasta *pages* e 
   o arquivo *login.step.rb* na *step_definitions*

```
📁testes_web
  |
  |- 📁 features
  |   |- 📁 bdd
  |   |     |- 📑 login.feature
  |   |- 📁 pages
  |   |     |- 📑 login.page.rb
  |   |- 📁 step_definitions
  |   |     |- 📑 login.step.rb
  |   |- 📁 support
  |         |- 📑 env.rb
  |
  |- 📑 Gemfile
  |- 📑 Gemfile.lock
  |- 📑 readme.md
           
```

- bdd - pasta contendo todos os bdd
- pages - pasta que terá todas as ações e elementos referentes às paginas automatizadas

5. Criar cenario *login.feature* e em seguida rodar comando *cucumber* no terminal. Copiar as chaves geradas e
 colar no arquivo *login.step.rb* em step_definitions/login.step.rb

```ruby
#language: pt

Funcionalidade: Sistema de login
Para ter acesso ao sistema
O usuario do Linkedin
Deseja logar no site

Cenario: Login com sucesso
Dado que o usuario queira se logar
Quando ele digitar as credenciais validas
Entao deve acessar o site com sucesso
```
6. Criar Pageobject para mapear os elementos. Em *pages/login.page.rb*

```ruby
class LoginPage < SitePrism::Page

  element :emailField, :id, "session_key"
  element :passwordField, :id, "session_password"
  element :loginButton, :xpath, "//*[@id="main-content"]/section[1]/div/div/form[1]/div[2]/button"

  def userLogin
    emailField.set "Seu Email"
    passwordField.set "Sua Senha"
    loginButton.click
  end
end
```

Em construção







