defmodule Phgen.Todos do
  @moduledoc """
  The Todos context.
  """

  import Ecto.Query, warn: false
  alias Phgen.Repo

  alias Phgen.Todos.Activities

  @doc """
  Returns the list of activities.

  ## Examples

      iex> list_activities()
      [%Activities{}, ...]

  """
  def list_activities do
    Repo.all(Activities)
  end

  @doc """
  Gets a single activities.

  Raises `Ecto.NoResultsError` if the Activities does not exist.

  ## Examples

      iex> get_activities!(123)
      %Activities{}

      iex> get_activities!(456)
      ** (Ecto.NoResultsError)

  """
  def get_activities!(id), do: Repo.get!(Activities, id)

  @doc """
  Creates a activities.

  ## Examples

      iex> create_activities(%{field: value})
      {:ok, %Activities{}}

      iex> create_activities(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_activities(attrs \\ %{}) do
    %Activities{}
    |> Activities.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a activities.

  ## Examples

      iex> update_activities(activities, %{field: new_value})
      {:ok, %Activities{}}

      iex> update_activities(activities, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_activities(%Activities{} = activities, attrs) do
    activities
    |> Activities.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a activities.

  ## Examples

      iex> delete_activities(activities)
      {:ok, %Activities{}}

      iex> delete_activities(activities)
      {:error, %Ecto.Changeset{}}

  """
  def delete_activities(%Activities{} = activities) do
    Repo.delete(activities)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking activities changes.

  ## Examples

      iex> change_activities(activities)
      %Ecto.Changeset{data: %Activities{}}

  """
  def change_activities(%Activities{} = activities, attrs \\ %{}) do
    Activities.changeset(activities, attrs)
  end
end
