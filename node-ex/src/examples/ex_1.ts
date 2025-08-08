import {
  getJsonPath,
  getDataFromKey,
  jsonObject2IntVector,
  IntVect,
  CustomNumberArray
} from "../utils";

export async function ex_1(key: string) {
  const jsonPath = getJsonPath(1);
  const jsonData = await getDataFromKey(jsonPath, key);

  if (jsonData === null) {
    console.error("Error Parsing JSON");
    return;
  }

  const data: number[] | null = jsonObject2IntVector(jsonData);

  if (data === null) {
    console.error("Error Loading Data");
    return;
  }

  const gifts = prepareGifts(data);
  console.log(gifts);
}

function prepareGifts(gifts: IntVect): IntVect {
//   return [...new Set(gifts)].sort( (a,b) => a-b );
  return new CustomNumberArray( ...new Set(gifts) ).sortBy('ascending');
}
