#include <iostream>
#include <string>

#include <nlohmann/json.hpp>
// # include "../third-libs/nlohmann/json.hpp"

#include "advent/adventEx.hpp"
#include "utils/globals.hpp"

int ad_ex::testJsonLib( str key ){

    std::cout << "Executing TestJsonLib Function\n"
              << "JSON-Key: " << key << "\n\n";

    nlohmann::json j = {
        {"name", "Alice"},
        {"age", 25},
        {"city", "Paris"}
    };

    std::cout << j.dump(4) << std::endl;

    return 0;
}