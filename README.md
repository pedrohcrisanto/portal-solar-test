# Portal Solar Test - Implementação
## Configuração

Clone o projeto

```sh
$ git clone https://github.com/pedrohcrisanto/portal-solar-test.git
```

Instale as dependências
```sh
$ cd /portal-solar-test/
$ sudo docker-compose run --rm app bundle install
```

Crie o banco, migre as tabelas e logo após popule o banco de dados
```sh
$ sudo docker-compose run --rm app bundle exec rails db:create db:migrate db:seed 
```

Rode a aplicação
```sh
$ sudo docker-compose up
```

Abra o seu navegador(de preferência Chrome ou Firefox) e navegue para `localhost:3000`

Para realizar Testes
```sh
$ sudo docker-compose run --rm app bundle exec rspec
```
## Deploy no Heroku

https://portal-solar-test.herokuapp.com/

