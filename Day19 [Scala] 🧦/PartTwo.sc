case class Blueprint(i: Int, ore_ore: Int, clay_ore: Int, obsidian_ore: Int, obsidian_clay: Int, geode_ore: Int, geode_obsidian: Int)

def most_geodes(ore_robots: Int, clay_robots: Int, obsidian_robots: Int, geode_robots: Int,
                  ore: Int, clay: Int, obsidian: Int, geodes: Int, minutes: Int, blueprint: Blueprint): Int = {
    val (next_ore, next_clay, next_obsidian, next_geodes) = (ore + ore_robots, clay + clay_robots, obsidian + obsidian_robots, geodes + geode_robots)
    if (minutes == 1) {
      return next_geodes
    }
    if (ore >= blueprint.geode_ore && obsidian >= blueprint.geode_obsidian) {
      return most_geodes(ore_robots, clay_robots, obsidian_robots, geode_robots + 1, next_ore - blueprint.geode_ore, next_clay, next_obsidian - blueprint.geode_obsidian, next_geodes, minutes - 1, blueprint)
    }
    if (ore >= blueprint.obsidian_ore && clay >= blueprint.obsidian_clay) {
      return most_geodes(ore_robots, clay_robots, obsidian_robots + 1, geode_robots, next_ore - blueprint.obsidian_ore, next_clay - blueprint.obsidian_clay, next_obsidian, next_geodes, minutes - 1, blueprint)
    }
    var options = Seq[Int]()
    if (ore < 4) {
      options :+= most_geodes(ore_robots, clay_robots, obsidian_robots, geode_robots, next_ore, next_clay, next_obsidian, next_geodes, minutes - 1, blueprint)
    }
    if (ore >= blueprint.ore_ore) {
      options :+= most_geodes(ore_robots + 1, clay_robots, obsidian_robots, geode_robots, next_ore - blueprint.ore_ore, next_clay, next_obsidian, next_geodes, minutes - 1, blueprint)
    }
    if (ore >= blueprint.clay_ore) {
      options :+= most_geodes(ore_robots, clay_robots + 1, obsidian_robots, geode_robots, next_ore - blueprint.clay_ore, next_clay, next_obsidian, next_geodes, minutes - 1, blueprint)
    }
    options.max
}

private def parse_input(line: String): Blueprint = {
    line match {
      case s"Blueprint ${i}: Each ore robot costs ${ore} ore. Each clay robot costs ${clay} ore. Each obsidian robot costs ${obsidian_ore} ore and ${obsidian_clay} clay. Each geode robot costs ${geode_ore} ore and ${geode_obsidian} obsidian." =>
        Blueprint(i.toInt, ore.toInt, clay.toInt, obsidian_ore.toInt, obsidian_clay.toInt, geode_ore.toInt, geode_obsidian.toInt)
    }
}

def runPartTwo(input: String, minutes: Int = 32) = {
    val lines = input.split("\n").take(3)
    lines.map(parse_input).map { blueprint =>
      most_geodes(1, 0, 0, 0, 0, 0, 0, 0, minutes, blueprint)
    }.product
  }