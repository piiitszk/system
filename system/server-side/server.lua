local cases = {}

function SetPlayerHunted(player,case)
    RemovePlayerHunted(player)
    cases[player] = {case = case, duration = duration or 5 * 60000, start_time = os.time()}
end

function RemovePlayerHunted(player)
    cases[player] = nil
end

function UpdateCaseDuration(player, duration)
    if cases[player] then
        cases[player].duration = duration * 60000 or 5 * 60000
        return true
    end

    return false
end

function IsPlayerHunted(player)
    local case = cases[player]
    if case then
        local remaining = GetRemainingCaseDurationForPlayer(player)
        if case and remaining > 0 then
            return true,case.case,remaining
        end
    end
    return false
end

function GetRemainingCaseDurationForPlayer(player)
    local case = cases[player]
    if case then
        return case.duration - (os.time() - case.start_time)
    end
end 
    
function EndAllCases()
    cases = {}
end

function HasCasesUnderDuration(duration)
    local underDurationCases = {}

    for player,case in pairs(cases) do
        if GetRemainingCaseDurationForPlayer(player) < duration * 60000 or GetRemainingCaseDurationForPlayer(player) < 5 * 60000 then
            table.insert(underDurationCases,cases[player])
        end
    end

    return underDurationCases
end

function pushCases()
    return cases,#cases
end

AddEventHandler("playerConnect", function(user_id,source)
    local case = cases[user_id]
    if case then
        TriggerClientEvent("Notify",source,"vermelho","Você está sendo procurado...",9000)
    end
end)
