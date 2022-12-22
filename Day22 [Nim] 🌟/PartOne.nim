import re
import strutils
import tables

proc walk(input: string, portals: Table[(Coord, Coord), (Coord, Coord)]): int =
  let pts = input.split("\n\n")
  let instrs = pts[1]
  var grid = newSeq[seq[char]]()
  for line in pts[0].splitLines:
    grid.add newSeq[char]()

    for c in line:
      grid[^1].add c

  var pos: Coord = (0, grid[0].find('.'))
  var dir: Coord = (0, 1)

  for instr in instrs.findAll(re"\d+|."):
    if instr == "L":
      dir *= (0, 1)
    elif instr == "R": 
      dir *= (0, -1)
    else:
      for _ in 1..instr.parseInt:
        if (pos, dir) in portals:
          let (pos2, dir2) = portals[(pos, dir)]
          if grid[pos2] == '#':
            break
          pos = pos2
          dir = dir2
        else:
          var pos2 = pos + dir
          if grid[pos2] == '#':
            break
          pos = pos2
          
  let finalRow = pos.x + 1
  let finalCol = pos.y + 1
  let finalFacing = if dir == (0, 1): 0
                    elif dir == (1, 0): 1
                    elif dir == (0, -1): 2
                    elif dir == (-1, 0): 3

  1000 * finalRow + 4 * finalCol + finalFacing

proc runPartOne*(input: string): int =
  var portals = initTable[(Coord, Coord), (Coord, Coord)]()
    # Limits of the grid are not portals if we cross the left coords, we go to the right ones 
  for i in 0..49:
    portals[((0, 50+i), (-1, 0))] = ((149, 50+i), (-1, 0))
    portals[((149, 50+i), (1, 0))] = ((0, 50+i), (1, 0))
    portals[((0, 100+i), (-1, 0))] = ((49, 100+i), (-1, 0))
    portals[((49, 100+i), (1, 0))] = ((0, 100+i), (1, 0))
    portals[((0+i, 50), (0, -1))] = ((0+i, 149), (0, -1))
    portals[((0+i, 149), (0, 1))] = ((0+i, 50), (0, 1))
    portals[((50+i, 50), (0, -1))] = ((50+i, 99), (0, -1))
    portals[((50+i, 99), (0, 1))] = ((50+i, 50), (0, 1))
    portals[((100, 0+i), (-1, 0))] = ((199, 0+i), (-1, 0))
    portals[((199, 0+i), (1, 0))] = ((100, 0+i), (1, 0))
    portals[((100+i, 0), (0, -1))] = ((100+i, 99), (0, -1))
    portals[((100+i, 99), (0, 1))] = ((100+i, 0), (0, 1))
    portals[((150+i, 0), (0, -1))] = ((150+i, 49), (0, -1))
    portals[((150+i, 49), (0, 1))] = ((150+i, 0), (0, 1))
  walk(input, portals)