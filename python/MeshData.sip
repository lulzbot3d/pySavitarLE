// Copyright (c) 2022 Ultimaker B.V.
// pySavitar is released under the terms of the LGPLv3 or higher.

class MeshData
{
    %TypeHeaderCode
    #include "Savitar/MeshData.h"
    %End
public:
    MeshData();
    virtual ~MeshData();
    bytearray getVerticesAsBytes();
    bytearray getFacesAsBytes();

    bytearray getFlatVerticesAsBytes();

    void setVerticesFromBytes(const bytearray& data);

    void setFacesFromBytes(const bytearray& data);

    bytearray getUVCoordinatesPerVertexAsBytes(const Scene* scene) const;

    std::string getTexturePath(const Scene* scene) const;
};
