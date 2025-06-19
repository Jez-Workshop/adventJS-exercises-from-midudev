import {
    getFunc2Execute
} from './examples';

//  MAIN EXECUTION
if( process.argv.length < 3 ) {
    console.error('Usage: node main.js <example_number>');
    process.exit(1);
}

const num = Number( process.argv[2] );
const fun2Exe = getFunc2Execute(num);

if(fun2Exe === null){
    console.error(`Example with number: ${num} does not exist`);
    process.exit(1);
}

fun2Exe();

