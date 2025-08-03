#include <string>
#include <map>
#include <vector>

#include <nlohmann/json.hpp>

#ifndef AVD_GLOBALS_H
#define AVD_GLOBALS_H


using json = nlohmann::json;

using str = std::string;
using adventExPtr = int(*)(str);


using EnvVar = std::map<str, str>;
using JsonUniquePtr = std::unique_ptr<json>;
using IntVect = std::vector<int>;

extern str global_root_path;

#endif
