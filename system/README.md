# Sistema de procurado

> > > Adicionar:

# exports["system"]:SetPlayerHunted(user_id,"reason",duration)

-> Essa função não retorna nada
-> Adiciona 5 minutos default caso o "duration" seja nulo

> > > Remover:

# exports["system"]:RemovePlayerHunted(user_id)

-> Essa função não retorna nada

> > > Atualizar Duração:

# exports["system"]:UpdateCaseDuration(user_id,duration)

-> Essa função não retorna nada
-> Atualiza o tempo do jogador
-> Caso "duration" seja nulo, atualiza novamente para 5 minutos

> > > IsPlayerHunted:

# exports["system"]:IsPlayerHunted(user_id)

-> Essa função retorna verdadeiro (caso o player esteja procurado), motivo e o tempo de procurado
-> Retorna false caso não esteja procurado

> > > GetRemainingCaseDurationForPlayer:

# exports["system"]:GetRemainingCaseDurationForPlayer(user_id)

-> Essa função retorna a duração do player em milisegundos

> > > EndAllCases:

# exports["system"]:EndAllCases()

-> Essa função não retorna nada
-> Finaliza a duração e todos os procurados atuais

> > > HasCasesUnderDuration:

# exports["system"]:HasCasesUnderDuration(duration)

-> Essa função retorna uma tabela com todos os casos a duração menor que a do argumento
-> Caso o argumento "duration" seja nulo, retornará os casos abaixo com duração abaixo de 5 minutos

> > > pushCases:

# exports["system"]:pushCases()

-> Essa função retorna uma tabela com todos os casos e o total de casos ativos

< Método de uso para todos >

RegisterCommand("system", function()
    local nonReturn = exports["system"]:SetPlayerHunted(user_id,"reason",duration)
    local nonReturn = exports["system"]:RemovePlayerHunted(user_id)
    local updated = exports["system"]:UpdateCaseDuration(user_id,duration)
    local hunted,reason,duration = exports["system"]:IsPlayerHunted(user_id)
    local duration = exports["system"]:GetRemainingCaseDurationForPlayer(user_id)
    local nonReturn = exports["system"]:EndAllCases()
    local cases = exports["system"]:HasCasesUnderDuration(duration)
    local cases = exports["system"]:pushCases()
end)



