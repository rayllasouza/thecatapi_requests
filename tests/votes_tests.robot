***Settings***
Resource        ../actions/votes_actions.robot



***Test Cases***
# Cenário: GET votes
#     Get votes
#     Validade status code "200"


# Cenário: GET specific vote
#     Get vote id
#     Get a specific vote
#     Validade status code "200"

# Cenário: Post create a vote
#     Post create a vote
#     Validade status code "200"
#     Validate message "SUCCESS"
    

Cenário: Delete a vote
    Create a new vote
    Delete a vote
    Validade status code "200"
    Validate message "SUCCESS"




    