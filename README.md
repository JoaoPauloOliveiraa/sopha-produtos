# Sopha-produtos

### Aplicação desenvolvida para cumprir requisitos do 1° teste no programa de treinamento UniSopha, ofertado pela empresa Sopha Tecnologia!

## Executando a aplicação

Instale o [docker](https://docs.docker.com/get-docker/) e o [docker-compose](https://docs.docker.com/compose/install/)

Instale o [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)

Para clonar o repositório abra o terminal e execute o comando abaixo:

```bash
git clone https://github.com/JoaoPauloOliveiraa/sopha-produtos.git
```
Entre no diretório sopha-produtos executando o seguinte comando:

```bash
cd sopha-produtos
```

Após isso execute os seguinte comandos:

```bash
cp .env.example .env
```

```bash
docker-compose build
```

Se receber alguma mensagem de erro: `ERROR: Service 'sopha.produtos' failed to build : Build failed`
Execute o comando abaixo para se tornar proprietário do diretório e execute novamente o comando anterior (docker-compose build)

```bash
sudo chown -R $USER:$USER .
```

Prossiga com os próximos passos

```bash
docker-compose run --rm sopha.produtos bash
```
Esse comando irá abrir um bash dentro do container criado

Então execute os seguintes comandos

```bash
bundle install
rails db:create db:migrate db:seed
```

Após isso aperte Ctrl-D(Linux ou Windows) ou Cmd-D (MacOS)

## Iniciando os containeres
###### `AVISO: Certifique-se de que as portas 3000 e 5432 não estão ocupadas.`

```bash
docker-compose up -d
```

Após isso, você deve obter a seguinte saída no terminal:
```bash
Starting sopha-produtos-db ... done
Starting sopha-produtos    ... done
```

Para verificar se os containeres estão de pé execute o comando:

```bash
docker-compose ps
```
Esses são os nomes dos containeres seguidos de seus respectivos serviços, executando atualmente:

```bash
sopha-produtos => sopha.produtos (rails)
sopha-produtos-db => db (postgres)
```

Caso algum container estiver mostrando `exit` e algum número na coluna State, veja os logs do container 
Para ler os logs do container execute:

```bash
docker logs <nome-do-container>
```

Para executar a aplicação em modo debugger

```bash
docker attach sopha-produtos
```
---

Entre no browser e digite `localhost:3000`

Depois desses passos você deve ver a aplicação em execução

Para realizar login entre com o usuario e senha:

Usuário
#### teste@email.com
Senha
#### 123456
