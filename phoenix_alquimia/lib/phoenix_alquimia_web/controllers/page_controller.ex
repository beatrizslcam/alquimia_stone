defmodule PhoenixAlquimiaWeb.PageController do
  use PhoenixAlquimiaWeb, :controller



  def upcase(conn, %{"value" => value})do
    json(conn, %{result: String.upcase(value)})
  end

  def downcase(conn, %{"value" => value})do
    json(conn, %{result: String.downcase(value)})
  end

  def snake_case(conn, %{"value" => value}) do
    json(conn, %{result: snakefy(value)})
  end
  def camelcase(conn, %{"value" => value})do
    value = value |>snakefy()|>Macro.camelize()
    json(conn, %{result: value})
  end

  def snakefy(value) do
    value
    |>String.downcase()
    |>String.replace(" ","_")
  end

  client = Tesla.client(
      [
        {Tesla.Middleware.BaseUrl, "http://localhost:5001/v1"},
        Tesla.Middleware.JSON,
        Tesla.Middleware.Logger
      ],
      Tesla.Adapter.Hackney
    )
  #TESTANDO
  {:ok,%{status: 200, body: %{"result" => resp_upcase}}} =
    Tesla.post(
      client,
      "/upcase",
      %{value: "exemplo de valor de request"}
    )

  case resp_upcase do
  "EXEMPLO DE VALOR DE REQUEST" -> :ok
  _ -> raise "valor não esperado de upcase"
  end


  {:ok,%{status: 200, body: %{"result" => resp_downcase}}} =
    Tesla.post(client,"/downcase",%{value: "ExEmPLO de INput"})

  case resp_downcase do
    "exemplo de input" -> :ok
    _ -> raise "valor não esperado de downcase"
  end

  {:ok,%{status: 200, body: %{"result" => resp_snake_case}}} =
    Tesla.post(client,"/snake_case",%{value: "ExEmPLO de INput"})

  case resp_snake_case do
    "exemplo_de_input" -> :ok
    _ -> raise "valor não esperado de snake_case"
  end

  {:ok,%{status: 200, body: %{"result" => resp_camelcase}}} =
    Tesla.post(client,"/camelcase",%{value: "ExEmPLO de INput"})

  case resp_camelcase do
    "exemploDeInput" -> :ok
    _ -> raise "valor não esperado de camelcase"
  end
end
