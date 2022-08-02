// Copyright (c) 2022 Ultimaker B.V.
// pySavitar is released under the terms of the LGPLv3 or higher.

%Module(name = pySavitar, call_super_init = True)

%Include Types.sip
%Include MetadataEntry.sip
%Include SceneNode.sip
%Include Scene.sip
%Include MeshData.sip

%ModuleHeaderCode
namespace Savitar{} //Ensure that the namespace already exists
using namespace Savitar;
%End

class ThreeMFParser
{
    %TypeHeaderCode
    #include "Savitar/ThreeMFParser.h"
    %End

public:
    ThreeMFParser();
    virtual ~ThreeMFParser();
    Scene parse(const std::string& xml_string);
    std::string sceneToString(Scene scene);
};