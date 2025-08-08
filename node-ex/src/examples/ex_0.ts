import { getJsonPath, getDataFromKey, jsonObject2IntVector } from '../utils'

export async function ex_0(key: string) {
  
  const jsonPath = getJsonPath(0);
  const jsonData = await getDataFromKey(jsonPath, key);

  if( jsonData === null ){
    console.error("Error Parsing JSON");
    return;    
  }

  const data: number[] | null = jsonObject2IntVector(jsonData);

  if (data === null) {
    console.error("Error Loading Data");
    return;
  }

  console.log("TypeSCript Setup is working perfectly!");
  console.log( data );
}
