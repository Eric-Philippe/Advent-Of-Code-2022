import * as fs from "fs";

import Instruction from "./Instruction.cjs";

const CRATE = "[#]";
const EMPTY = "   ";

export class PartOne {
  // Declare the table and the instructions
  public table: Array<Array<string>>;
  private instructions: Array<Instruction>;

  constructor() {
    this.table = PartOne.loadTable();
    this.instructions = PartOne.loadInstructions();
  }

  public static loadTable(): Array<Array<string>> {
    let fileName = "table.txt";
    let file;
    try {
      file = fs.readFileSync(fileName, "utf8");
    } catch (err) {
      console.error(err);
    }
    let table = file.split("\r");

    // Remove all the \n
    table = table.map((line) => line.replace("\n", ""));
    // Create the readabale vertical table
    let columns = [];
    for (let i = 0; i < table[0].length; i += 4) {
      let column = [];
      for (let j = 0; j < table.length; j++) {
        let crate = table[j].slice(i, i + 3);
        if (crate !== EMPTY) {
          column.push(crate);
        }
      }
      columns.push(column);
    }

    // Invert every element of the array
    columns = columns.map((column) => column.reverse());

    return columns;
  }

  public static loadInstructions(): Array<Instruction> {
    let fileName = "instructions.txt";
    let file;
    try {
      file = fs.readFileSync(fileName, "utf8");
    } catch (err) {
      console.error(err);
    }

    // Instructions are separated by \n
    // every instruction look like this: move 8 from 4 to 6
    let instructions = file.split("\n");

    let instructionsArray = [];
    for (let i = 0; i < instructions.length; i++) {
      let instruction = instructions[i].split(" ");
      let amountToMove = parseInt(instruction[1]);
      let from = parseInt(instruction[3]);
      let to = parseInt(instruction[5]);
      instructionsArray.push({
        amountToMove: amountToMove,
        from: from,
        to: to,
      });
    }

    return instructionsArray;
  }

  public moveCrate(): Array<Array<string>> {
    for (let i = 0; i < this.instructions.length; i++) {
      let instruction = this.instructions[i];
      let from = instruction.from - 1;
      let to = instruction.to - 1;

      for (let j = 0; j < instruction.amountToMove; j++) {
        let crate = this.table[from].pop();

        this.table[to].push(crate);
      }
    }

    return this.table;
  }

  public printSolution(debug: Boolean = true): string {
    let cratesOnTop = "";
    // Print every last element of the table
    for (let i = 0; i < this.table.length; i++) {
      cratesOnTop += this.table[i][this.table[i].length - 1];
    }
    if (debug) console.log(cratesOnTop);

    return cratesOnTop;
  }
}
