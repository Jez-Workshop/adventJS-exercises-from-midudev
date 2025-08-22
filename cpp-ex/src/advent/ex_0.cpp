#include <iostream>
#include "adventEx.hpp"

#include "utils/globals.hpp"
#include "utils/utils.hpp"

int ad_ex::ex_0(str key)
{
    std::cout << "Cpp Setup is working perfectly!\t" << "JSON-Key: " << key << "\n\n";

    str jsonDataPath = ad_utils::getJsonPathFile(0);
    JsonUniquePtr jsonData = ad_utils::getDataFromKey(jsonDataPath, key);

    if (!jsonData)
    {
        std::cout << "Error Reading JsonData\n";
        return 1;
    }

    IntVect data;
    bool result = ad_utils::json2IntVect(jsonData, data);

    if (!result)
    {
        std::cout << "Error Conversion JsonData\n";
        return 1;
    }

    std::cout << "IntVect contents:\n[";
    for (auto &val : data)
    {
        std::cout << val << " ";
    }
    std::cout << "]\n";

    return 0;
}