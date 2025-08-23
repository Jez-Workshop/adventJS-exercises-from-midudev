#include <iostream>
#include <fstream>
#include <string>

#include "advent/adventEx.hpp"

#include "utils/globals.hpp"
#include "utils.hpp"


adventExPtr ad_utils::getEx( int exId ){

    switch (exId)
    {
    case 0: return ad_ex::ex_0;

    case 999: return ad_ex::testJsonLib;
    case 998: return ad_ex::testEnvFile;
    
    default:
        return nullptr;
    }

}

str trim(const str& s)
{
    auto start = s.find_first_not_of(" \t\r\n");
    auto end = s.find_last_not_of(" \t\r\n");
    if (start == str::npos)
        return "";
    return s.substr(start, end - start + 1);
}

EnvVar ad_utils::load_env(const str& filename)
{
    EnvVar env;
    std::ifstream file(filename);
    str line;

    while (std::getline(file, line))
    {
        line = trim(line);

        // Skip empty lines or comments
        if (line.empty() || line[0] == '#')
            continue;

        auto pos = line.find('=');
        if (pos == std::string::npos)
            continue; // invalid line

        std::string key = trim(line.substr(0, pos));
        std::string value = trim(line.substr(pos + 1));

        env[key] = value;
    }

    return env;
}

void ad_utils::print_env(const EnvVar &env)
{
    for (const auto &[key, value] : env)
    {
        std::cout << key << "=" << value << "\n";
    }
}

str ad_utils::getJsonPathFile(int val)
{
    str env_path = global_root_path + ".env";
    EnvVar env = ad_utils::load_env(env_path);

    str jsonDataFileName = env["JSON_DATA_PREFIX"] +  std::to_string(val) + ".json";
    return global_root_path + env["JSON_FOLDER_NAME"] + jsonDataFileName;
}

JsonUniquePtr ad_utils::getDataFromKey(str& pathJSONFile, str& keyToSearch)
{
    try
    {
        // Open the file
        std::ifstream file(pathJSONFile);
        if (!file.is_open())
        {
            std::cerr << "Error: Could not open file " << pathJSONFile << std::endl;
            return nullptr;
        }

        // Parse the JSON
        json j;
        file >> j;

        // Search for the key
        if (j.contains(keyToSearch))
        {
            // return a copy of the key's value
            // JSONUniquePtr pairKeyValue = std::make_unique<json>(j[keyToSearch]);
            // return pairKeyValue;
            return std::make_unique<json>(j[keyToSearch]);
        }
        else
        {
            std::cout << "Key '" << keyToSearch << "' not found in the JSON file." << std::endl;
            return nullptr;
        }
    }
    catch (const json::parse_error &e)
    {
        std::cerr << "JSON parse error: " << e.what() << std::endl;
    }
    catch (const json::type_error &e)
    {
        std::cerr << "JSON type error: " << e.what() << std::endl;
    }
    catch (const std::exception &e)
    {
        std::cerr << "Error: " << e.what() << std::endl;
    }

    return nullptr;
}

bool ad_utils::json2IntVect(const JsonUniquePtr &j, IntVect& result)
{
    if (!j->is_array())
    {
        std::cerr << "Error: Expected an array to convert to IntVect." << std::endl;
        return false;
    }

    for (const auto &val : *j)
    {
        if (val.is_number_integer())
        {
            result.push_back(val.get<int>());
        }
        else
        {
            std::cerr << "Warning: Non-integer value encountered in JSON array." << std::endl;
            return false;
        }
    }

    return true;
}