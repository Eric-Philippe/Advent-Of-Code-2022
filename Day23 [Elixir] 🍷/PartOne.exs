defmodule Main do

  def parse_input(data) do
    data
    |> String.split("\n")
    |> Enum.with_index()
    |> Enum.flat_map(&parse_line/1)
    |> MapSet.new()
  end

  def parse_line({line, r}) do
    line
    |> String.to_charlist()
    |> Enum.with_index()
    |> Enum.filter(fn {char, _} -> char == ?# end)
    |> Enum.map(fn {_char, c} -> {c, -r} end)
  end

  def do_a_round(elf_locations, direction_queue) do
    proposals = get_proposals(elf_locations, direction_queue)
    proposal_counts = Enum.frequencies(Map.values(proposals))
    valid_proposals = Map.filter(proposals, fn {_, d} -> Map.fetch!(proposal_counts, d) == 1 end)
    to_remove = Map.keys(valid_proposals) |> MapSet.new()
    to_add = Map.values(valid_proposals) |> MapSet.new()
    new_locations = elf_locations |> MapSet.union(to_add) |> MapSet.difference(to_remove)
    {new_locations, map_size(valid_proposals)}
  end

  def get_proposals(elf_locations, direction_queue) when is_list(direction_queue) do
    elf_locations
    |> Enum.filter(&any_in?(Map.values(get_directions(&1)), elf_locations))
    |> Enum.map(&get_proposal(&1, elf_locations, direction_queue))
    |> Enum.filter(&(&1 != nil))
    |> Map.new()
  end

  def any_in?(enum, set) do
    Enum.any?(enum, &(&1 in set))
  end

  def get_proposal(elf, elf_locations, direction_queue) when is_list(direction_queue) do
    direction_queue
    |> Enum.map(&get_proposal(elf, elf_locations, &1))
    |> Enum.filter(&(&1 != nil))
    |> List.first()
  end

  def get_proposal(elf, elf_locations, d) do
    dirs = get_directions(elf)

    case d do
      ?north ->
        case any_in?([dirs.north, dirs.north_east, dirs.north_west], elf_locations) do
          true -> nil
          false -> {elf, dirs.north}
        end

      ?south ->
        case any_in?([dirs.south, dirs.south_east, dirs.south_west], elf_locations) do
          true -> nil
          false -> {elf, dirs.south}
        end

      ?west ->
        case any_in?([dirs.west, dirs.north_west, dirs.south_west], elf_locations) do
          true -> nil
          false -> {elf, dirs.west}
        end

      ?east ->
        case any_in?([dirs.east, dirs.north_east, dirs.south_east], elf_locations) do
          true -> nil
          false -> {elf, dirs.east}
        end
    end
  end

  def get_directions({x, y}) do
    %{
      north: {x, y + 1},
      north_east: {x + 1, y + 1},
      east: {x + 1, y},
      south_east: {x + 1, y - 1},
      south: {x, y - 1},
      south_west: {x - 1, y - 1},
      west: {x - 1, y},
      north_west: {x - 1, y + 1}
    }
  end

  def count_empty_space(elf_locations) do
    {min_x, max_x} =
      elf_locations
      |> Enum.map(&elem(&1, 0))
      |> Enum.min_max()

    {min_y, max_y} =
      elf_locations
      |> Enum.map(&elem(&1, 1))
      |> Enum.min_max()

    cross_product(min_x..max_x, min_y..max_y)
    |> Enum.count(&(&1 not in elf_locations))
  end

  def cross_product(a, b) do
    Enum.flat_map(a, fn x -> Enum.map(b, fn y -> {x, y} end) end)
  end

  def runPartOne(data) do
    elf_locations = parse_input(data)
    direction_queue = ['north', 'south', 'west', 'east']

    {elf_locations, _} =
      Enum.reduce(1..10, {elf_locations, direction_queue}, fn _i, {locs, dirs} ->
        new_locs = elem(do_a_round(locs, dirs), 0)
        new_dirs = tl(dirs) ++ [hd(dirs)]
        {new_locs, new_dirs}
      end)

    count_empty_space(elf_locations)
  end

end
