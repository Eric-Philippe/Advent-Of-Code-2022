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
module.exports = class partOne {
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
   * @type {Object}
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
   * @type {Object}
   */
  static tableBeat = {
    A: "Z",
    B: "X",
    C: "Y",
    X: "C",
    Y: "A",
    Z: "B",
  };
  /**
   * Returns the score of the round for the mePlayer
   * @param {String} opponent The opponent's move
   * @param {String} mePlayer The mePlayer's move
   * @returns {Number}
   */
  static getScore = (opponent, mePlayer) => {
    const opponentScore = this.tableScore[opponent]; // get the score of the opponent
    const mePlayerScore = this.tableScore[mePlayer]; // get the score of the mePlayer
    // if draw case
    if (opponentScore === mePlayerScore) {
      return this.scoreDraw + this.tableScore[mePlayer];
    }
    // if win case
    if (this.tableBeat[mePlayer] === opponent) {
      return this.scoreWin + this.tableScore[mePlayer];
      // If loose case
    } else {
      return this.scoreLoose + this.tableScore[mePlayer];
    }
  };
  /**
   * Loop through all the lines of the input
   * @returns {Number} The end score of the mePlayer
   */
  static loopInput = () => {
    let score = 0;

    for (let i = 0; i < this.lines.length; i += 1) {
      const opponent = lines[i].split(" ")[0];
      const mePlayer = lines[i].split(" ")[1];

      score += getScore(opponent, mePlayer);
    }

    return score;
  };
  /**
   * Main Runner
   * @param {Boolean} debug
   * @returns {Number} The end score of the mePlayer
   */
  static run(debug = true) {
    let score = this.loopInput();
    if (debug) console.log(score);
    return score;
  }
};
