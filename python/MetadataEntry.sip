// Copyright (c) 2022 Ultimaker B.V.
// pySavitar is released under the terms of the LGPLv3 or higher.

class MetadataEntry
{
    %TypeHeaderCode
    #include "Savitar/MetadataEntry.h"
    %End

public:
    MetadataEntry(std::string value);
    MetadataEntry(std::string value, std::string type);
    MetadataEntry(std::string value, std::string type, bool preserve);

    std::string value;
    std::string type;
    bool preserve;
};