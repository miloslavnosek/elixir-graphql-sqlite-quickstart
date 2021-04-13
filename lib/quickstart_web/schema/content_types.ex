defmodule QuickstartWeb.Schema.ContentTypes do
  use Absinthe.Schema.Notation

  object :friend do
    field(:id, :id)
    field(:first_name, :string)
    field(:last_name, :string)
  end
end
