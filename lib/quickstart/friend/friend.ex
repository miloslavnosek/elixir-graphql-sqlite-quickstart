defmodule Quickstart.Friend do
  use Ecto.Schema

  schema "friends" do
    field(:first_name, :string)
    field(:last_name, :string)
  end

  def changeset(friend, params \\ %{}) do
    friend
    |> Ecto.Changeset.cast(params, [:first_name, :last_name])
  end
end
