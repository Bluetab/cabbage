defmodule Cabbage.ImportFeatures do
  use Cabbage.Feature

  defthen ~r/will raise an error/, _vars, _state do
    assert false
  end
end
