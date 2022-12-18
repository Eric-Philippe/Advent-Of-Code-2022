let cubes =
    inputPath = "input.txt"
    |> readLines
    |> Array.map (ints >> fun arr -> arr[0], arr[1], arr[2])
    |> Set.ofArray

let neighbors (x, y, z) =
    [ (x - 1, y, z)
      (x + 1, y, z)
      (x, y - 1, z)
      (x, y + 1, z)
      (x, y, z - 1)
      (x, y, z + 1) ]

let minmax seq = Seq.min seq, Seq.max seq

let minX, maxX = cubes |> Seq.map (fun (x, _, _) -> x) |> minmax
let minY, maxY = cubes |> Seq.map (fun (_, y, _) -> y) |> minmax
let minZ, maxZ = cubes |> Seq.map (fun (_, _, z) -> z) |> minmax

let outOfBounds (x, y, z) =
    (x < minX || x > maxX)
    || (y < minY || y > maxY)
    || (z < minZ || z > maxZ)

let rec expand notBubbles acc =
    match acc with
    | [] -> notBubbles
    | h :: _ when outOfBounds h -> Set.empty
    | h :: t ->
        neighbors h
        |> List.filter (fun pt -> Set.contains pt notBubbles |> not)
        |> fun l -> expand (Set.add h notBubbles) (l @ t)

let part2 =
    let cubesAndBubbles =
        [ for x in minX..maxX do
              for y in minY..maxY do
                  for z in minZ..maxZ do
                      if not (Set.contains (x, y, z) cubes) then
                          (x, y, z) ]
        |> Seq.fold
            (fun acc pt ->
                match expand acc [ pt ] with
                | s when Set.isEmpty s -> acc
                | s -> s)
            cubes

    cubes
    |> Seq.sumBy (fun c ->
        neighbors c
        |> List.filter (fun n -> Set.contains n cubesAndBubbles |> not)
        |> List.length)
