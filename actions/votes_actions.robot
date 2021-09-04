***Settings***
Documentation          Arquivo com as actions da rota /user

Resource               ../base.robot



***Keywords***
Get votes
    Create Session          thecatapi               ${BASE_URI}
    ${api_key}              Create Dictionary       x-api-key=30f6bf6d-8abf-4fa9-a32b-2c6d9e2033f4
    Log To Console          API KEY:${api_key} 
    ${response}=            Get On Session          thecatapi       /votes     headers=${api_key}
    Log To Console          Response: ${response.content}
    Set Global Variable     ${response}

Validade status code "${status}"
    Status Should be    ${status}     ${response}


Get vote id
    Get votes
    ${vote_id}          Set Variable      ${response.json()[0]["id"]}
    Log To Console      ID DO VOTO: ${vote_id}
    Set Global Variable     ${vote_id}

Get a specific vote
    Create Session          thecatapi               ${BASE_URI}
    ${api_key}              Create Dictionary       x-api-key=30f6bf6d-8abf-4fa9-a32b-2c6d9e2033f4
    Log To Console          API KEY:${api_key} 
    ${response}=            Get On Session          thecatapi       /votes/${vote_id}     headers=${api_key}
    Log To Console          Response: ${response.content}
    Set Global Variable     ${response}


Post create a vote
    Create Session          thecatapi               ${BASE_URI}

    ${image_id}             FakerLibrary.Word
    Log To Console          NOME DA IMAGEM: ${image_id}

    ${body}                 Create Dictionary          image_id=${image_id}     value=1              
    ${api_key}              Create Dictionary       x-api-key=30f6bf6d-8abf-4fa9-a32b-2c6d9e2033f4
    ${response}=            Post On Session          thecatapi       /votes    json=${body}     headers=${api_key}
    Log To Console          Response: ${response.content}
    Set Global Variable     ${response}

Validate message "${message}"
    Should Be Equal        ${response.json()["message"]}   ${message}
    Log To Console         ${response.json()["message"]}


Create a new vote
    Post create a vote
    ${vote_id}              Set Variable    ${response.json()["id"]} 
    Log To Console          ID DO NOVO VOTO CRIADO: ${vote_id}
    Set Global Variable     ${vote_id}

Delete a vote
    Create Session          thecatapi               ${BASE_URI}
    ${api_key}              Create Dictionary       x-api-key=30f6bf6d-8abf-4fa9-a32b-2c6d9e2033f4
    Log To Console          API KEY:${api_key} 
    ${response}=            Delete On Session          thecatapi       /votes/${vote_id}     headers=${api_key}
    Log To Console          VOTO EXCLUIDO Response: ${response.content}
    Set Global Variable     ${response}



