# Todo

To start your Phoenix server:

  * Install Docker, docker-compose and make
  * Add this line to /etc/hosts
    ```
    127.0.0.1       localhost todo.app.phx note.app.phx
    ```
  * Create **.env** file in the project root
    ```
    # Template
    POSTGRES_USER=example
    POSTGRES_PASSWORD=example
    POSTGRES_DB=example
    POSTGRES_HOST=db # Name of the db service in docker-compose.yml
    ```
  * Build images `make build`
  * Start Phoenix endpoint with `make run`

Now you can visit [`todo.app.phx`](http://todo.app.phx) and [`note.app.phx`](http://note.app.phx) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
