import { ex_0 } from "./ex_0";

type ExampleFunction = () => void;

export function getFunc2Execute(value: number): ExampleFunction | null {
  switch (value) {
    case 0:
      return ex_0;

    default:
      return null;
  }
}
