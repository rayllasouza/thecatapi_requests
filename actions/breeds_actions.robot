***Settings***
Documentation          Arquivo com as actions da rota /user

Resource               ../base.robot



***Keywords***
Get list breeds
    
    Create Session          thecatapi               ${BASE_URI}
    ${response}=            Get On Session          thecatapi       /breeds     
    Log To Console          Response: ${response.content}
    
    #${breed_id}             Set Variable      ${response.json()[0]["id"]}  
    #Log To Console          NOME DA RACA 1: ${response.json()[0]["id"]}

    Set Global Variable     ${response}

Validade list breeds response
    Should Not Be Empty   ${response.json()}
    Status Should Be        200    ${response}
    #Log To Console        RACA 1: ${response.json()[0]}


validate search breed by name response
    Should Not Be Empty   ${response.json()["weight"]}
    Log To Console        ${response.json()["weight"]}
    Status Should Be        200    ${response}


Get a breed name
    Get list breeds
    ${breed_name}           Set Variable      ${response.json()[0]["id"]}
    Log To Console          NOME DA RACA: ${response.json()[0]["id"]}
    Set Global Variable     ${breed_name}

Get search breed by name
    Create Session          thecatapi               ${BASE_URI}
    ${response}=            Get On Session          thecatapi               /breeds/${breed_name}     #url=/breeds?q=${breed_name}
    Log To Console          Response: ${response.content}
    Set Global Variable     ${response}
    Status Should Be        200    ${response} 
