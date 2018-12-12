defmodule Day01_02 do
  def repeated_freq(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&String.to_integer/1)
    |> Stream.cycle()
    |> Enum.reduce_while({0, [0]}, fn x, { current_freq, seen_freqs} ->
      new_freq = current_freq + x
      if new_freq in seen_freqs do
        {:halt, new_freq}
      else
        {:cont, {new_freq, [ new_freq | seen_freqs ]}}
      end
    end)

  end
end

case System.argv() do
  ["--test"] ->
    ExUnit.start()

    defmodule Day01_02Test do
      use ExUnit.Case

      test "example" do
        assert Day01_02.repeated_freq("+1\n-1") == 0
        assert Day01_02.repeated_freq("+3\n+3\n+4\n-2\n-4") == 10
        assert Day01_02.repeated_freq("-6\n+3\n+8\n+5\n-6") == 5
        assert Day01_02.repeated_freq("+7\n+7\n-2\n-7\n-4") == 14
      end
    end
  [input_file] ->
    input_file
    |> File.read!()
    |> Day01_02.repeated_freq()
    |> IO.puts
end

