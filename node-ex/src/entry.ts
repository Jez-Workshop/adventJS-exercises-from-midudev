import { ex_0, getFunc2Execute } from "./examples";

export function main() {
  if (process.argv.length < 3) {
    console.error(`No Number Args Passed`);
    process.exit(1);
  }

  const value = Number(process.argv[2])
  const func = getFunc2Execute(value);

  if (func === null) {
    console.error(`Example with number: ${value} does not exist`);
    process.exit(1);
  }

  func();
}
