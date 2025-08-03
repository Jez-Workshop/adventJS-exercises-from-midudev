import os
import json
from typing import Any

def getJsonPath( number: int ) -> str:
    
    json_data_prefix = os.getenv("JSON_DATA_PREFIX", "")
    root_path = os.getenv("ROOT_PATH", "")
    json_folder_name = os.getenv("JSON_FOLDER_NAME", "")

    json_file_name = f"{json_data_prefix}{number}.json"
    return os.path.join(root_path, json_folder_name, json_file_name)


def readJSON(path: str) -> Any:
    with open(path, 'r', encoding='utf-8') as f:
        return json.load(f)

def getDataFromKey(path: str, key: str)-> Any:
    try:
        data = readJSON(path)
        return data.get(key)
    except:
        return None
    
def jsonObject2IntVector( data: any ) -> list[int] | None:
    if isinstance(data, list):
        try:
            return [int(x) for x in data]
        except (ValueError, TypeError):
            return None
    return None