#include <iostream>
#include <set>

#include "adventEx.hpp"

#include "utils/globals.hpp"
#include "utils/utils.hpp"

int ad_ex::ex_1(str key)
{
    std::cout << "Cpp Setup is working perfectly!\t" << "JSON-Key: " << key << "\n\n";

    str jsonDataPath = ad_utils::getJsonPathFile(1);
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


    IntVect gifts = ad_ex::prepareGifts( data );

    std::cout << "IntVect contents:\n[";
    for (int val : gifts)
    {
        std::cout << val << " ";
    }
    std::cout << "]\n";

    return 0;
}

IntVect ad_ex::prepareGifts( IntVect& gifts )
{
    std::set<int> uniqueGifts(gifts.begin(), gifts.end());
    return IntVect(uniqueGifts.begin(), uniqueGifts.end());
}