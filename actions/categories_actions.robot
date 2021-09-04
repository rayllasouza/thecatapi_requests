***Settings***
Documentation          Arquivo com as actions da rota /user

Resource               ../base.robot



***Keywords***
Get list categories
    Create Session          thecatapi               ${BASE_URI}
    ${response}=            Get On Session          thecatapi       /categories
    Log To Console          Response: ${response.content}
    Set Global Variable     ${response}

validate categories response
     Should Not Be Empty   ${response.json()[0]}
     Log To Console        CATEGORIA 1: ${response.json()[0]}
     Status Should Be        200    ${response}