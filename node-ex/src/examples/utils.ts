import { readFile } from "fs/promises";
import { ex_0 } from "./ex_0";

type ExampleFunction = ( key:string ) => void;

export function getFunc2Execute(value: number): ExampleFunction | null {
  switch (value) {
    case 0:
      return ex_0;

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

export function jsonObject2IntVector(data: any): number[] | null {
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