from helpers.shared import getJsonPath, getDataFromKey, jsonObject2IntVector

def ex_1( key: str ):
    
    jsonPath = getJsonPath( 1 )
    jsonData = getDataFromKey( jsonPath, key )
    
    if jsonData == None:
        print(f'Error Reading JSON File. Data with Key-${key} not found')
        return
    
    if jsonData == None: return
    
    data = jsonObject2IntVector( jsonData )

    if data == None: 
        print(f'Fail Conversion Data')
        return
    
    gifts = prepare_gifts( data )    
    print( gifts )

    
    
def prepare_gifts(gifts: list[int]) -> list[int]:
  return sorted( list( set( gifts ) ) )
