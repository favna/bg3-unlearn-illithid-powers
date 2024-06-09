function GetUniqueEntities(DB_Players)
    local entitiesList = {}

    local entities = Osi[DB_Players]:Get(nil)
    for _, entity in pairs(entities) do
        table.insert(entitiesList, entity[1])
    end

    local seen = {}
    local index = 1
    while index <= #entitiesList do
        if seen[entitiesList[index]] then
            table.remove(entitiesList, index)
        else
            seen[entitiesList[index]] = true
            index = index + 1
        end
    end

    return entitiesList
end

-- Event listener for LevelGameplayStarted
Ext.Osiris.RegisterListener("LevelGameplayStarted", 2, "after", function(level, isEditorMode)
    -- Get unique entities from the "Players" database
    local uniquePlayers = GetUniqueEntities("DB_Players")

    -- Remove the 'Mind Sanctuary' Illithid passive from all unique players
    for _, player in pairs(uniquePlayers) do
		Ext.Osiris.
		Osi.RemovePassive(player, 'TAD_MindSanctuary')
    end
end)