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

    -- Remove all Illithid passives and spells from all unique players, this is the inverse of the regular mod logic
    for _, player in pairs(uniquePlayers) do
		Osi.RemovePassive(player, 'CRE_GithInfirmary_Awakened')
		Osi.RemovePassive(player, 'TAD_Charm')
		Osi.RemovePassive(player, 'TAD_CullTheWeak')
		Osi.RemovePassive(player, 'TAD_Displace')
		Osi.RemovePassive(player, 'TAD_DrainAbility')
		Osi.RemovePassive(player, 'TAD_Expertise')
		Osi.RemovePassive(player, 'TAD_Freecast')
		Osi.RemovePassive(player, 'TAD_LuckOfTheFarRealms')
		Osi.RemovePassive(player, 'TAD_MindSanctuary')
		Osi.RemovePassive(player, 'TAD_PerilousStakes')
		Osi.RemovePassive(player, 'TAD_PsionicBacklash')
		Osi.RemovePassive(player, 'TAD_PsionicDominance')
		Osi.RemovePassive(player, 'TAD_PeaceBreaker')
		Osi.RemovePassive(player, 'TAD_IllithidPersuasion')
		Osi.RemoveSpell(player, "Shout_TAD_DisplacerBeast", 1)
		Osi.RemoveSpell(player, "Target_SurvivalInstinct", 1)
		Osi.RemoveSpell(player, "Shout_TAD_PsionicOverload", 1)
		Osi.RemoveSpell(player, "Projectile_TAD_Levitate", 1)
		Osi.RemoveSpell(player, "Target_TAD_TransfuseHealth", 1)
		Osi.RemoveSpell(player, "Target_TAD_ShieldOfThralls", 1)
		Osi.RemoveSpell(player, "Zone_TAD_MindBlast", 1)
		Osi.RemoveSpell(player, "Target_TAD_AbsorbIntellect", 1)
		Osi.RemoveSpell(player, "Target_TAD_BlackHole", 1)
		Osi.RemoveSpell(player, "Target_TAD_ConcentratedBlast", 1)
		Osi.RemoveSpell(player, "Rush_ForceTunnel", 1)
		Osi.RemoveSpell(player, "Target_StageFright", 1)
		Osi.RemoveSpell(player, "Shout_Repulsor", 1)
		Osi.RemoveSpell(player, "Target_SupernaturalAttraction", 1)
		Osi.RemoveSpell(player, "Shout_EndlessRage", 1)
		Osi.RemoveSpell(player, "Target_TAD_Imperil", 1)
		Osi.RemoveSpell(player, "Target_PsionicPull", 1)
		Osi.RemoveSpell(player, "Shout_Inkblot", 1)
		Osi.RemoveSpell(player, "Shout_AberrantShape", 1)
		Osi.RemoveSpell(player, "Shout_ReflectiveShell", 1)
		Osi.RemoveSpell(player, "Projectile_Fly", 1)
    end
end)