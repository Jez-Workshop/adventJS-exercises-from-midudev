import { readFile } from "fs/promises";
import { ex_0, ex_1 } from "../examples";

import { ExampleFunction, IntVect } from "./custom-alias";

// type ExampleFunction = ( key:string ) => void;

export function getFunc2Execute(value: number): ExampleFunction | null {
  switch (value) {
    case 0:
      return ex_0;

    case 1:
      return ex_1;

    default:
      return null;
  }
}

export function getJsonPath(number: number): string {
  const jsonFileName = `${process.env.JSON_DATA_PREFIX}${String(number)}.json`;

  return `${process.env.ROOT_PATH}${process.env.JSON_FOLDER_NAME}${jsonFileName}`;
}

export async function readJSON(path: string) {
  const data = await readFile(path, "utf-8");
  return JSON.parse(data);
  // return json;
}

export async function getDataFromKey(path: string, key: string): Promise<any> {
  try {
    const data = await readJSON(path);
    return data[key];
  } catch (error) {
    return null;
  }
}

export function jsonObject2IntVector(data: any): IntVect | null {
  if (!Array.isArray(data)) {
    console.error("Provided data is not an array");
    return null;
  }

  const result: number[] = [];

  for (const item of data) {
    const num = Number(item);
    if (Number.isNaN(num)) {
      console.error(`Invalid number in array: ${item}`);
      return null;
    }
    result.push(num);
  }

  return result;
}

export class CustomNumberArray extends Array<number> {
  constructor(...items: number[]) {
    super(...items);

    Object.setPrototypeOf(this, CustomNumberArray.prototype);
  }

  sortBy(type: "ascending" | "descending"): this {
    return type === "ascending" ? this.sortAscending() : this.sortDescending();
  }

  protected sortAscending(): this {
    return this.sort((a, b) => a - b);
  }

  protected sortDescending(): this {
    return this.sort((a, b) => b - a);
  }
}
