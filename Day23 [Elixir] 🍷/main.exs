defmodule Main do
  def run() do
    get_input() |> solve()
  end

  def get_input() do
    "input.txt"
    |> File.read!()
    |> String.trim()
  end

  def solve(data) do
    runPartOne(data) |> IO.inspect()
    runPartTwo(data) |> IO.inspect()
  end
end

Main.run()
