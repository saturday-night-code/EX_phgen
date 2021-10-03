<p align="center"><img src="https://avatars.githubusercontent.com/u/87999310" alt="saturday night code logo" width="122px" style="border-radius: 10px"/></p>

<h1 align="center">EX_phgen</h1>

A CRUD(Create, Read, Update, Delete) using Phoenix Generator in Elixir.

## What was used?

- [Phoenix](https://phoenixframework.org/)
- [Phoenix Generator - HTML](https://hexdocs.pm/phoenix/Mix.Tasks.Phx.Gen.Html.html)

## :runner: To run this project?

First, you need to have installed Erlang, Elixir and Phoenix.

<details>
  <summary>Install: Erlang and Elixir</summary>

  For Debian/Ubuntu based system:

  1. Add Erlang repository: `wget https://packages.erlang-solutions.com/erlang-solutions_2.0_all.deb && sudo dpkg -i erlang-solutions_2.0_all.deb`
  2. `sudo apt-get update`
  3. Install Erlang: `sudo apt-get install esl-erlang` and `sudo apt install erlang`
  4. Install Elixir: `sudo apt-get install elixir`
  
  After installation, run: `elixir --version` to verify that it was correctly installed.
</details>

<details>
  <summary>Install: Phoenix</summary>

  For Debian/Ubuntu based system:

  1. Install: `mix archive.install hex phx_new 1.5.8`
  2. Accept all questions with "Y"
</details>

<details>
  <summary>Install: Docker</summary>

  For Debian/Ubuntu based system:

  1. `sudo apt update`
  2. Remove others installations: `sudo apt remove docker docker-engine docker.io`
  3. Install docker.io: `sudo apt install docker.io`

  To enable Docker in startup:

  1. `sudo systemctl start docker`
  2. `sudo systemctl enable docker`

  After installation, run: `docker version` to verify that it was correctly installed.

  **All docker commands must have `sudo` before;**
</details>

<details>
  <summary>Create and Connect: PostgreSQL and PgAdmin4</summary>

  1. Get pdAdmin4 docker image: `sudo docker pull dpage/pgadmin4`
  2. Create docker postgres network: `sudo docker network create --driver bridge postgres-network`
  3. Create and start a postgres docker container running with postgres-network: `sudo docker run --name postgres --network=postgres-network -e "POSTGRES_PASSWORD=postgres" -p 5432:5432 -d postgres`
  4. Create and start a pgadmin docker container running with postgres-network: `sudo docker run --name pgadmin --network=postgres-network -p 15432:80 -e "PGADMIN_DEFAULT_EMAIL=<your_email>" -e "PGADMIN_DEFAULT_PASSWORD=bpgadmin" -d dpage/pgadmin4`

  After installation, access in your Browser: [http://localhost:15432](http://localhost:15432) to view pgAdmin4 web interface.

  **To connect a new server in pgAdmin4 web interface**:
  
  ```json
    name = pgAdmin connection name
    comments = description about the connection

    connection/host-name = container name
    connection/port = 5432
    connection/username = postgres (default)
    connection/password = postgres container password
  ```
</details>

<details>
  <summary>Create: Only PostgreSQL container</summary>

  1. PostgreSQL docker image: `sudo docker run --name postgres -e POSTGRES_PASSWORD=postgres -p 5432:5432 -d postgres`

  **The authentication data for this database is**:

  ```json
    user: postgres,
    password: postgres
  ```
</details>

<details>
  <summary>Create: New project using Phoenix</summary>

  1. Create new Phoenix project: `mix phx.new projectName` and `cd projectName`
  2. Configure your database in config/dev.exs and run: `mix ecto.create`
</details>


<details>
  <summary>Create: CRUD using Phoenix Generator</summary>

  1. In project root folder, run: `mix phx.gen.html ContextName EntityName tableName attr1:attType attr2:attType`
  2. Run the migration: `mix ecto.migrate`
</details>

Run Phoenix project: `mix phx.server`

Use `mix phx.routes` to see all routes in your project.

## Contributing

1. Fork it (<https://github.com/saturday-night-code/EX_phgen/fork>)
2. Create your feature branch (`git checkout -b EX_phgen-Type-feature`)
3. Commit your changes (`git commit -am 'Type: some feature'`)
   1. Available Types (replace in Type): Add|Fix|Review
4. Push to the branch (`git push origin EX_phgen-Type-feature`)
5. Create a new Pull Request
