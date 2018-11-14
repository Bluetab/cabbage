Code.require_file("test_helper.exs", __DIR__)
defmodule Cabbage.StackTraceTest do
  use ExUnit.Case

  import ExUnit.CaptureIO

  test "raise exception with correct imported module and line" do
    defmodule ImportStepTest do
      use Cabbage.Feature, file: "import_features.feature"
      import_steps(Cabbage.ImportFeatures)
    end

    case function_exported?(ExUnit.Server, :cases_loaded, 0) do
        true -> ExUnit.Server.cases_loaded()
        _ -> ExUnit.Server.modules_loaded()
    end


    assert capture_io(fn ->
             assert ExUnit.run() == %{failures: 1, skipped: 0, total: 1}
           end) =~ "test/support/import_features.ex:5"
  end
end
