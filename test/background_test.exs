defmodule Cabbage.BackgroundTest do
  use Cabbage.Feature, file: "cofee_background.feature"

  import_feature Cabbage.GlobalFeatures

  setup do
    {:ok, %{starting: :state}}
  end

  defthen ~r/^I should be served a coffee$/, _, %{coffees: coffees} do
    assert coffees - 1 >= 0
    {:ok, %{coffees: coffees - 1}}
  end

  defwhen ~r/^I press the coffee button$/, _, %{deposited: deposited} do
    {:ok, %{deposited: deposited - 1}}
  end

  defthen ~r/^I should be served (?<served>\d+) coffees$/, %{served: served}, %{coffees: coffees} do
    served = String.to_integer(served)
    assert coffees - served >= 0
    {:ok, %{coffees: coffees - served}}
  end

  defgiven ~r/^the following data table$/, %{table: [%{id: "1", name: "Luke"}, %{id: "2", name: "Darth"}]}, _state do
    :ok
  end
end
