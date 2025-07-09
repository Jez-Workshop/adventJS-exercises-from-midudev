#include <iostream>

#include "advent/adventEx.hpp"

int main(int argc, char **argv)
{
    if (argc < 2)
    {
        std::cerr << "No Args passed. Please pass a int nuber\n";
        return 1;
    }

    int value = std::atoi(argv[1]);

    adventExPtr func = ad_ex::getEx(value);

    if (func == nullptr)
    {
        std::cerr << "That function does not exist" << "\n";
        return 1;
    }

    func();
    return 0;
}
