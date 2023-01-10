game "gta5"
fx_version "cerulean"

server_scripts {
    "server-side/*"
}

server_exports {
    "SetPlayerHunted",
    "RemovePlayerHunted",
    "UpdateCaseDuration",
    "IsPlayerHunted",
    "GetRemainingCaseDurationForPlayer",
    "EndAllCases",
    "HasCasesUnderDuration",
    "pushCases"
}
