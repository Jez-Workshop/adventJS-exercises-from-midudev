#include <iostream>

#include "utils/globals.hpp"
#include "utils/utils.hpp"
#include "advent/adventEx.hpp"

int ad_ex::testEnvFile( str key )
{
    std::cout << "Executing TestLoadEnvFile Function\n"
              << "JSON-Key: " << key << "\n\n";

    str env_path = global_root_path + ".env";

    EnvVar envs = ad_utils::load_env( env_path );

    ad_utils::print_env( envs );

    return 0;
}