import os from 'os';
import path from 'path';

// Basic info
console.log('Node.js TypeScript Test Script');
console.log('==============================');
console.log(`Node.js version: ${process.version}`);
console.log(`Platform: ${process.platform} (${process.arch})`);
console.log(`CPU cores: ${os.cpus().length}`);
console.log(`Memory: ${Math.round(os.totalmem() / (1024 * 1024 * 1024))}GB`);
console.log(`Current directory: ${process.cwd()}`);
console.log(`Script path: ${__dirname}`);
console.log(`Script filename: ${path.basename(__filename)}`);