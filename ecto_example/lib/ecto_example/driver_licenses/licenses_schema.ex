defmodule EctoExample.DriverLicense.Schemas.License do
  use Ecto.Schema

  alias EctoExample.DriverLicense.Schemas.Driver

  schema "drivers" do
    field(:type, :string)
    field(:digits, :string)

    belongs_to(:driver, Driver)

    timestamps()
  end
end
