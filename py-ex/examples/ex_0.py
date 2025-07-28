from helpers.shared import getJsonPath, getDataFromKey, jsonObject2IntVector

def ex_0( key: str ):
    
    jsonPath = getJsonPath( 0 )
    
    print( jsonPath )
    jsonData = getDataFromKey( jsonPath, key )
    
    if jsonData == None: return
    
    data = jsonObject2IntVector( jsonData )

    if data == None: return
    
    print( data )
    print('Python Setup is working perfectly!')
