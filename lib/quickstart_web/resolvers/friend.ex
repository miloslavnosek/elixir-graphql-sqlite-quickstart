defmodule QuickstartWeb.Resolvers.Friend do
  def list_friends(_parent, _args, _resolution) do
    res =
      Quickstart.Friend
      |> Quickstart.Repo.all()

    {:ok, res}
  end

  def create_friend(_parent, args, _resolution) do
    new_friend = %Quickstart.Friend{
      first_name: if is_map_key(args, :first_name) do args.first_name else nil end,
      last_name: if is_map_key(args, :last_name) do args.last_name else nil end
    }

    Quickstart.Repo.insert(new_friend)
  end

  def update_friend(_parent, args, _resolution) do
    friend = Quickstart.Repo.get(Quickstart.Friend, args.id)

    changeset = Quickstart.Friend.changeset(friend, %{
      first_name: if is_map_key(args, :first_name) do args.first_name else nil end,
      last_name: if is_map_key(args, :last_name) do args.last_name else nil end
    })

    Quickstart.Repo.update(changeset)
  end

  def delete_friend(_parent, args, _resolution) do
    friend = Quickstart.Repo.get(Quickstart.Friend, args.id)

    Quickstart.Repo.delete(friend)
  end
end
