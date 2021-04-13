defmodule QuickstartWeb.Schema do
  use Absinthe.Schema
  import_types(QuickstartWeb.Schema.ContentTypes)

  alias QuickstartWeb.Resolvers

  query do
    @desc "Get all friends"
    field :friends, list_of(:friend) do
      resolve(&Resolvers.Friend.list_friends/3)
    end
  end

  mutation do
    @desc "Create a friend"
    field :create_friend, type: :friend do
      arg(:first_name, :string)
      arg(:last_name, :string)

      resolve(&Resolvers.Friend.create_friend/3)
    end

    @desc "Update a friend"
    field :update_friend, type: :friend do
      arg(:id, non_null(:id))
      arg(:first_name, :string)
      arg(:last_name, :string)

      resolve(&Resolvers.Friend.update_friend/3)
    end

    @desc "Delete friend :("
    field :delete_friend, type: :friend do
      arg(:id, non_null(:id))

      resolve(&Resolvers.Friend.delete_friend/3)
    end
  end
end
