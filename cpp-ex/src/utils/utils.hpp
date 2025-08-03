#include "utils/globals.hpp"

namespace ad_utils
{
    
    adventExPtr getEx( int );

    EnvVar load_env(const str& );
    void print_env(const EnvVar& );

    str getJsonPathFile( int );
    JsonUniquePtr getDataFromKey( str&, str& );
    bool json2IntVect( const JsonUniquePtr&, IntVect& );

} // namespace 
