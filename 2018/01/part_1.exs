defmodule Day01_01 do
  def adjust(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&String.to_integer/1)
    |> Enum.sum
  end
end

case System.argv() do
  ["--test"] ->
    ExUnit.start()

    defmodule Day01_01Test do
      use ExUnit.Case

      test "examples" do
        assert Day01_01.adjust("+1\n+1\n+1") == 3
        assert Day01_01.adjust("+1\n+1\n-2") == 0
        assert Day01_01.adjust("-1\n-2\n-3") == -6
      end
    end

  [input_file] ->
    input_file
    |> File.read!()
    |> Day01_01.adjust()
    |> IO.puts
end
