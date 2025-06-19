import {
    ex_0,
} from '.';

type ExampleFunction = () => void;

export function getFunc2Execute(num: number): ExampleFunction | null {
    switch (num) {
        case 0: return ex_0;

        // Add more cases for other examples as needed
        
        default: return null;
    }
}