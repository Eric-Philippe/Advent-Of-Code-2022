const partOne = require("../partOne");
const partTwo = require("../partTwo");
const assert = require("assert");
describe("Part One Scores Tests", () => {
  it("should return 8", () => {
    assert.equal(partOne.getScore("A", "Y"), 8);
  });
  it("should return 1", () => {
    assert.equal(partOne.getScore("B", "X"), 1);
  });
  it("should return 6", () => {
    assert.equal(partOne.getScore("C", "Z"), 6);
  });
  it("should return 15", () => {
    let score = 0;
    score += partOne.getScore("A", "Y");
    score += partOne.getScore("B", "X");
    score += partOne.getScore("C", "Z");
    assert.equal(score, 15);
  });
});

describe("Part One This beats That", () => {
  it("should return Z", () => {
    assert.equal(partOne.tableBeat["A"], "Z");
  });
  it("should return X", () => {
    assert.equal(partOne.tableBeat["B"], "X");
  });
  it("should return Y", () => {
    assert.equal(partOne.tableBeat["C"], "Y");
  });

  describe("Part Two Scores Tests", () => {
    it("should return 4", () => {
      assert.equal(partTwo.getScore("A", "Y"), 4);
    });
    it("should return 1", () => {
      assert.equal(partTwo.getScore("B", "X"), 1);
    });
    it("should return 7", () => {
      assert.equal(partTwo.getScore("C", "Z"), 7);
    });
    it("should return 12", () => {
      let score = 0;
      score += partTwo.getScore("A", "Y");
      score += partTwo.getScore("B", "X");
      score += partTwo.getScore("C", "Z");
      assert.equal(score, 12);
    });
  });
});
