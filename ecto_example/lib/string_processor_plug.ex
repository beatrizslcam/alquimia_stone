defmodule StringProcessorPlug do
  # import Plug.Conn

  # @behaviour Plug

  # @impl Plug
  # def init(opts), do: opts

  # @impl Plug
  # def call(conn, _opts) do
  #   # primeiro precisamos pegar os parâmentros de path
  #   path = conn.request_path

  #   # Agora pegamos os parâmetros de query
  #   # para isso precisamos chamar uma função importada de Plug.Conn
  #   conn = fetch_query_params(conn)

  #   query = conn.query_params
  #   value = query["value"]

  #   case {path, value} do
  #     # caso o valor seja vazio não temos o que fazer
  #     {_, value} when value == "" or is_nil(value) ->
  #       send_resp(conn, 200, "")

  #     {"/upcase", value} ->
  #       response = String.upcase(value)
  #       send_resp(conn, 200, response)

  #     {"/downcase", value} ->
  #       response = String.downcase(value)
  #       send_resp(conn, 200, response)

  #     {"/snakecase", value} ->
  #       response = snakefy(value)
  #       send_resp(conn, 200, response)

  #     {"/camelcase", value} ->
  #       response =
  #         value
  #         |> snakefy()
  #         # essa função transforma de snake_case para camelcase
  #         |> Macro.camelize()

  #       send_resp(conn, 200, response)
  #   end
  # end

  # def snakefy(value) do
  #   value
  #   |> String.downcase()
  #   |> String.replace(" ", "_")
  # end

  use Plug.Router
  use Tesla

  plug(:match)
  plug(:fetch_query_params)
  plug(:dispatch)

  get "/upcase" do
    value = conn.query_params["value"]
    send_resp(conn, 200, String.upcase(value))
  end

  get "/downcase" do
    value = conn.query_params["value"]
    send_resp(conn, 200, String.downcase(value))
  end

  get "/snakecase" do
    value = conn.query_params["value"]
    send_resp(conn, 200, snakefy(value))
  end

  get "/camelcase" do
    value = conn.query_params["value"]
    response = value |> snakefy() |> Macro.camelize()
    send_resp(conn, 200, response)
  end

  match _ do
    send_resp(conn, 404, "Not found!")
  end

  def snakefy(value) do
    value
    |> String.downcase()
    |> String.replace(" ", "_")
  end

  # o primeiro parâmetro é a lista de "middlewares", ou funções que podem alterar a requisição
  client =
    Tesla.client(
      [
        # irá parsear para a gente o corpo da requisição e a resposta
        Tesl.Middleware.JSON,
        # irá prefixar paths com a URL
        {Tesla.Middleware.BaseURL, "http://localhost:4000"},
        Tesla.Middleware.Logger
      ],
      # além dos middleware,, precisamos dizer qual é abiblioteca específica de redes
      # vamos usar o :hackney mas existem outras possibilidades
      Tesla.Adapter.Hackney
    )

  Tesla.post(client, "/upcase_big_body", %{value: "valor de um atributo json"})
end
