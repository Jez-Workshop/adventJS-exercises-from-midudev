#include <iostream>
#include "adventExamples/adventExamples.hpp"

int main(int argc, char** argv) {

    if (argc < 2) {
        std::cerr << "No Args passed. Please pass a int nuber\n";
        return 1;
    }

    int value = std::atoi(argv[1]);

    if( value < 0 ){
        std::cerr << "Value must be >= 0" << "\n" ; return 1;
    }

    std::cout << "Executing Example: " << value << "\n";

    AdventEx_Ptr2Func func = ad_ex::getExample2Execute( value );

    if( func == nullptr ){
        std::cerr << "That function does not exist" << "\n" ; return 1;
    }

    func();

    return 0;
}