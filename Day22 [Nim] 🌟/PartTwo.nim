import './PartOne'

proc runPartTwo*(input: string): int =
  var portals = initTable[(Coord, Coord), (Coord, Coord)]()
  for i in 0..49:
    # Limits of the grid are not portals if we cross the left coords, we go to the right ones 
    portals[((0, 50+i), (-1, 0))] = ((150+i, 0), (0, 1))
    portals[((150+i, 0), (0, -1))] = ((0, 50+i), (1, 0))
    portals[((0, 100+i), (-1, 0))] = ((199, 0+i), (-1, 0))
    portals[((199, 0+i), (1, 0))] = ((0, 100+i), (1, 0))
    portals[((0+i, 50), (0, -1))] = ((149-i, 0), (0, 1))
    portals[((149-i, 0), (0, -1))] = ((0+i, 50), (0, 1))
    portals[((0+i, 149), (0, 1))] = ((149-i, 99), (0, -1))
    portals[((149-i, 99), (0, 1))] = ((0+i, 149), (0, -1))
    portals[((49, 100+i), (1, 0))] = ((50+i, 99), (0, -1))
    portals[((50+i, 99), (0, 1))] = ((49, 100+i), (-1, 0))
    portals[((50+i, 50), (0, -1))] = ((100, 0+i), (1, 0))
    portals[((100, 0+i), (-1, 0))] = ((50+i, 50), (0, 1))
    portals[((149, 50+i), (1, 0))] = ((150+i, 49), (0, -1))
    portals[((150+i, 49), (0, 1))] = ((149, 50+i), (-1, 0))
  walk(input, portals)