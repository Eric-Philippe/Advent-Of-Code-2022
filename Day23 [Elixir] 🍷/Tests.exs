defmodule Day23 Tests
  use ExUnit.Case
  doctest Day23

  test "part 1" do
    assert Day23.runPartOne("389125467") == "67384529"
  end

  test "part 2" do
    assert Day23.runPartTwo("389125467") == 149245887792
  end
end
