defmodule Main do
  def runPartTwo(data) do
    elf_locations = parse_input(data)
    direction_queue = ['n', 's', 'w', 'e']
    rounds_until_stable(elf_locations, direction_queue, 0)
  end

  def rounds_until_stable(elf_locations, dirs, rounds) do
    case do_a_round(elf_locations, dirs) do
      {_, 0} -> rounds + 1
      {l, _} -> rounds_until_stable(l, tl(dirs) ++ [hd(dirs)], rounds + 1)
    end
  end
end
