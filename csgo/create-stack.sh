#!/usr/bin/env sh

# if [[ -z "$STEAM_GAME_SERVER_TOKEN" ]]; then
#     echo "Error: STEAM_GAME_SERVER_TOKEN not set"
#     exit 1
# fi

aws cloudformation create-stack \
    --stack-name linkup4 \
    --template-body file://./cloudformation.yml \
    --parameters \
        ParameterKey=SshIngressIP,ParameterValue="$(curl https://icanhazip.com/ | head -n 1)/32" \
        ParameterKey=InstanceType,ParameterValue=t2.large
