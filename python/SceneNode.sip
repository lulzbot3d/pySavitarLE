// Copyright (c) 2025 Ultimaker B.V.
// pySavitar is released under the terms of the LGPLv3 or higher.

class SceneNode
{
    %TypeHeaderCode
    #include "Savitar/SceneNode.h"
    %End
public:
    SceneNode();
    virtual ~SceneNode();

    MeshData& getMeshData();

    std::vector<SceneNode*> getChildren();

    std::string getTransformation();
    void setTransformation(std::string);
    
    std::string getName();
    void setName(std::string name);

    int getId();
    void setId(const int id);

    const std::map<std::string, MetadataEntry>& getSettings() const;
    void setSetting(const std::string& key, MetadataEntry& entry);
    void setSetting(const std::string& key, const std::string& value);
    void setSetting(const std::string& key, const std::string& value, const std::string& type);
    void setSetting(const std::string& key, const std::string& value, const std::string& type, const bool preserve);

    bool addChild(SceneNode* child /Transfer/);
    
    std::string getType();
    void setType(std::string type);

    std::string getComponentPath() const;
    void parseComponentData(const std::string& xml_string);
};

