defmodule EctoExample.DriverLicense.Schemas.Driver do
  use Ecto.Schema

  alias EctoExample.DriverLicense.Schemas.License

  schema "drivers" do
    field(:first_name, :string)
    field(:last_name, :string)

    has_many(:licenses, License)

    timestamps()
  end
end
