# Todo

To start your Phoenix server:

- Install Docker, docker-compose and make
- Add this line to /etc/hosts
  ```
  127.0.0.1       localhost todo.app.phx note.app.phx
  ```
- Create **.env** file in the project root

  - For development:

  ```
  # Template
  POSTGRES_USER=example
  POSTGRES_PASSWORD=example
  POSTGRES_DB=example
  POSTGRES_HOST=db # Name of the db service in docker-compose.yml
  ```

  - For production:

  ```
  # Template
  POSTGRES_USER=example
  POSTGRES_PASSWORD=example
  POSTGRES_DB=example
  POSTGRES_HOST=db # Name of the db service in docker-compose.yml
  MIX_ENV=prod
  PORT=4000
  SECRET_KEY_BASE= # You can generate one by calling: mix phx.gen.secret
  DATABASE_URL=ecto://example:example@db/example
  ```

- Build images `make build`
- Start Phoenix endpoint with `make run`
- Create database `make create-all`
- Run migrations `make migrate-all`
- List services and status `make ps`

Now you can visit [`todo.app.phx/api/todos/`](http://todo.app.phx/api/todos/) and [`note.app.phx/api/notes/`](http://note.app.phx/api/notes/) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

- Official website: http://www.phoenixframework.org/
- Guides: https://hexdocs.pm/phoenix/overview.html
- Docs: https://hexdocs.pm/phoenix
- Mailing list: http://groups.google.com/group/phoenix-talk
- Source: https://github.com/phoenixframework/phoenix
