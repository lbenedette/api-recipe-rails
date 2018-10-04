# README

API Recipes

Instalação
==
Com o projeto baixado em sua máquina execute o comando para criar os containers utilizando docker-compose

`$ docker-compose up --build`

Depois de terminado é preciso executar alguns comandos dentro do container do rails

`$ docker exec -ti rails bash`

`(docker) $ rails db:migrate`

`(docker) $ rails db:seed`

Assim é executado as migrations e um seed que cria 10 receitas e um usuário para testes:

**email: test@test.com**

**password: password**

Para entrar no sistema visite [Login](http://localhost:8080/login)