defmodule HomeworkWeb.Schema do
  @moduledoc """
  Defines the graphql schema for this project.
  """
  use Absinthe.Schema

  alias HomeworkWeb.Resolvers.MerchantsResolver
  alias HomeworkWeb.Resolvers.TransactionsResolver
  alias HomeworkWeb.Resolvers.UsersResolver
  alias HomeworkWeb.Resolvers.CompaniesResolver
  import_types(HomeworkWeb.Schemas.Types)

  query do
    @desc "Get all Transactions"
    field(:transactions, list_of(:transaction)) do
      resolve(&TransactionsResolver.transactions/3)
    end

    @desc "Get all Users"
    field(:users, list_of(:user)) do
      resolve(&UsersResolver.users/3)
    end

    @desc "Get all Merchants"
    field(:merchants, list_of(:merchant)) do
      resolve(&MerchantsResolver.merchants/3)
    end

    @desc "Get all Companies"
    field(:companies, list_of(:company)) do
      resolve(&CompaniesResolver.companies/3)
    end

    @desc "Fuzzy Search Merchants"
    field(:search_merchants, list_of(:merchant)) do
      arg(:name, non_null(:string))
      resolve(&MerchantsResolver.search_merchants/3)
    end

    @desc "Fuzzy Search Users"
    field(:search_users, list_of(:user)) do
      arg(:first_name, non_null(:string))
      arg(:last_name, non_null(:string))
      resolve(&UsersResolver.search_users/3)
    end

    @desc "Fuzzy Search Users"
    field(:search_companies, list_of(:company)) do
      arg(:name, non_null(:string))
      resolve(&CompaniesResolver.search_companies/3)
    end

    @desc "Get transactions between min and max"
    field(:search_transactions, list_of(:transaction)) do
      arg(:min, non_null(:integer))
      arg(:max, non_null(:integer))
      resolve(&TransactionsResolver.search_transactions/3)
    end
  end

  mutation do
    import_fields(:transaction_mutations)
    import_fields(:user_mutations)
    import_fields(:merchant_mutations)
    import_fields(:company_mutations)
  end
end
