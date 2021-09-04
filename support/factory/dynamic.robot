*** Settings ***
Library             FakerLibrary

*** Keywords ***
# Get Valid User Payload
#     #${id}                   FakerLibrary.Random Number      digits=2
#     ${username}             FakerLibrary.User Name
#     ${firstName}            FakerLibrary.Name
#     ${lastName}             FakerLibrary.Last Name
#     ${email}                FakerLibrary.Email
#     &{payload}=             Create Dictionary     id=0    username=${username}      firstName=${firstName}     lastName=${lastName}     email=${email}      password=123    phone=12999999999      userStatus=0  
#     Log To Console          Payload criado: ${payload}
#     [return]                ${payload}




Get Valid Vote Payload
    ${image_id}             FakerLibrary.Word

    &{payload}              create





    