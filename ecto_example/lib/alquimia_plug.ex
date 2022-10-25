defmodule MyPlug do
  import Plug.Conn

  @behaviour Plug.Conn

  @impl Plug
  # o papel da função init é de inicializar o plug, nela podemos fazer algumas validações
  # Ela precisa retornar um conjunto de opções do Plug que serão as opções finais
  def init(options) do
    options
  end

  @impl Plug
  def call(conn, _opts) do
    # conn = put_resp_content_type(conn,"text/plain")

    # conn_as_string = inspect(conn, limit: :infinity, pretty: true)

    # send_resp(conn,200, conn_as_string)

    header_as_string = inspect(conn.req_headers, pretty: true)
    {:ok, body, conn} = read_body(conn)

    resp_body = """
    Method: #{conn.method}
    Host: #{conn.host}
    Port: #{conn.port}
    Request path: #{conn.request_path}
    Query string: #{conn.query_string}
    Body: #{conn.resp_body}
    Request Headers: #{header_as_string}
    """

    conn
    |> put_resp_content_type("text/plain")
    |> send_resp(200, resp_body)
  end
end
