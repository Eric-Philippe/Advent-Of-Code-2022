/**
 * @author Ericp
 * @Date 02-12-2022
 */
///////// Imports //////////
const fs = require("file-system");
const path = require("path");
/**
 * PaperRockScissors Game
 * Except that the rules are different ;
 * In case of draw the both players get 3 points
 * In case of win the winner gets 6 points
 * And each element gives more or less points
 */
module.exports = class partTwo {
  /**
   * The input path of the given game
   * @type {String}
   */
  static inputPath = path.join(__dirname, "input.txt");
  /**
   * The input of the given game
   * @type {any}
   */
  static input = fs.readFileSync(this.inputPath, { encoding: "utf-8" });
  /**
   * The input's lines
   * @type {Array}
   */
  static lines = this.input.split(/\r?\n/);
  /**
   * The loose score
   * @type {Number}
   */
  static scoreLoose = 0;
  /**
   * The draw score
   * @type {Number}
   */
  static scoreDraw = 3;
  /**
   * The win score
   * @type {Number}
   */
  static scoreWin = 6;
  /**
   * The table of the score
   * - A Opponent Rock
   * - B Opponent Paper
   * - C Opponent Scissors
   * - X mePlayer Rock
   * - Y mePlayer Paper
   * - Z mePlayer Scissors
   *  @type {Object}
   */
  static tableScore = {
    A: 1,
    B: 2,
    C: 3,
    X: 1,
    Y: 2,
    Z: 3,
  };
  /**
   * The table of the beat
   * First one beats the second one
   * @type {Object[]}
   */
  static tableBeat = [
    { A: "Z" },
    { B: "X" },
    { C: "Y" },
    { X: "C" },
    { Y: "A" },
    { Z: "B" },
  ];
  /**
   * Returns the score of the round for the mePlayer depending on the opponent's choice
   * If we read a Y it means that we have to play the same choice as the opponent
   * If we read a Z it means that we have to play the choice that beats the opponent
   * If we read a X it means that we have to play the choice that is beaten by the opponent
   * @param {String} opponent The opponent's move
   * @param {String} mePlayer The mePlayer's move
   * @returns {Number}
   */
  static getScore = (opponent, mePlayer) => {
    // If we read the Y, we need to play the same element as the opponent
    if (mePlayer === "Y") {
      return this.scoreDraw + this.tableScore[opponent];
    }
    // If we read the X we need to play the element that gets beaten by the opponent
    if (mePlayer === "X") {
      return this.tableScore[
        this.tableBeat.find((item) => item[opponent])[opponent]
      ];
    }
    // If we read the Z we need to play the element that beats the opponent
    if (mePlayer === "Z") {
      let elementThatBeats = this.tableBeat.find(
        (item) => Object.values(item)[0] === opponent
      );

      return this.scoreWin + this.tableScore[Object.keys(elementThatBeats)[0]];
    }
  };
  /**
   * Loops through the lines and returns the total score
   * @returns {Number}
   */
  static loopInput = () => {
    let score = 0;

    for (let i = 0; i < lines.length; i += 1) {
      const opponent = lines[i].split(" ")[0]; // The opponent's move
      const mePlayer = lines[i].split(" ")[1]; // The round end choice

      score += getScore(opponent, mePlayer);
    }

    return score;
  };
  /**
   * Main Runner
   * @param {Boolean} debug If true, it will print the result
   * @returns {Number}
   */
  static run = (debug = true) => {
    const result = loopInput();
    if (debug) console.log("Result: ", result);
    return result;
  };
};
