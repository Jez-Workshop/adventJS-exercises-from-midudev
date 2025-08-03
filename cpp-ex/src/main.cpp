#include <iostream>

#include "utils/utils.hpp"
#include "utils/globals.hpp"

int main(int argc, char **argv)
{
    if (argc < 3)
    {
        std::cerr << "No Args passed. Please pass a int nuber\n";
        return 1;
    }

    int value = std::atoi(argv[1]);

    adventExPtr func = ad_utils::getEx(value);

    if (func == nullptr)
    {
        std::cerr << "That function does not exist" << "\n";
        return 1;
    }

    func( argv[2] );
    return 0;
}
