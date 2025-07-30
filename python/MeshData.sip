// Copyright (c) 2025 Ultimaker B.V.
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

    void setUVCoordinatesPerVertexAsBytes(const bytearray& data, const std::string& texture_path, Scene* scene);

    std::string getTexturePath(const Scene* scene) const;
};
