import { PartOne } from "../src/PartOne.cjs";

describe("testing index file", () => {
  // Test if all the methods work
  test("PartOne Load Instructions", () => {
    expect(PartOne.loadInstructions[0]).toBe({
      amountToMove: 3,
      from: 8,
      to: 9,
    });
  });
  test("PartOne load Instruction toHaveProperty", () => {
    expect(PartOne.loadInstructions[0]).toHaveProperty("amountToMove");
  });
  test("PartOne load Instruction toHaveProperty", () => {
    expect(PartOne.loadInstructions[0]).toHaveProperty("from");
  });
  test("PartOne load Instruction toHaveProperty", () => {
    expect(PartOne.loadInstructions[0]).toHaveProperty("to");
  });
  test("PartOne Load  Table", () => {
    expect(PartOne.loadTable[0]).toBeInstanceOf(Array);
  });
  test("PartOne Display Solution", () => {
    let partOne = new PartOne();
    expect(partOne.printSolution()).toReturn();
  });
});
