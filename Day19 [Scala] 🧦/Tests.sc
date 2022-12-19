import PartOne._
import PartTwo._

case class Blueprint(i: Int, ore_ore: Int, clay_ore: Int, obsidian_ore: Int, obsidian_clay: Int, geode_ore: Int, geode_obsidian: Int)

// Tests for Part One
assert(most_geodes(1, 0, 0, 0, 0, 0, 0, 0, 24, Blueprint(1, 1, 1, 1, 1, 1, 1)) == 1)