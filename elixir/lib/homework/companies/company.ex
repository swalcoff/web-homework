defmodule Homework.Companies.Company do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  schema "companies" do
    field(:name, :string)
    field(:credit_line, :integer)
    field(:available_credit, :integer)
    field(:description, :string)

    timestamps()
  end

  @doc false
  def changeset(company, attrs) do
    company
    |> cast(attrs, [:name, :credit_line, :available_credit, :description])
    |> validate_required([:name, :credit_line, :available_credit, :description])
  end
end
