defmodule PhoenixAlquimiaWeb.Router do
  use PhoenixAlquimiaWeb, :router

  pipeline :json_api do
    plug(Plug.Parsers, params: [{:json, json_decoder: Jason }])
  end

  scope "/v1", MyPhoenixExample do
    pipe_through(:json_api)

    post("/upcase", FirstController, :upcase)
    post("/downcase", FirstController, :downcase)
    post("/camelcase", FirstController, :camelcase)
    post("/snake_case", FirstController, :snake_case)
  end
end
