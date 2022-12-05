import { PartOne } from "./PartOne.cjs";
import { PartTwo } from "./PartTwo.cjs";

const PartOneInstance = new PartOne();
const PartTwoInstance = new PartTwo();

PartOneInstance.moveCrate();
PartOneInstance.printSolution();

PartTwoInstance.moveCrate();
PartTwoInstance.printSolution();
