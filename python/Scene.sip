// Copyright (c) 2022 Ultimaker B.V.
// pySavitar is released under the terms of the LGPLv3 or higher.

class Scene
{
    %TypeHeaderCode
    #include "Savitar/Scene.h"
    %End
public:
    Scene();
    virtual ~Scene();

    std::vector<SceneNode*> getSceneNodes();
    std::vector<SceneNode*> getAllSceneNodes();

    void addSceneNode(SceneNode* node /Transfer/);

    const std::map<std::string, MetadataEntry>& getMetadata() const;
    void setMetaDataEntry(const std::string& key, MetadataEntry& entry);
    void setMetaDataEntry(const std::string& key, const std::string& value);
    void setMetaDataEntry(const std::string& key, const std::string& value, const std::string& type);
    void setMetaDataEntry(const std::string& key, const std::string& value, const std::string& type, const bool preserve);

    std::string getUnit();
    void setUnit(std::string unit);
};

