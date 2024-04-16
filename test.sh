#!/bin/bash

ACCESS_TOKEN="YOUR_ACCESS_TOKEN"

# Step 1: Get followers of the authenticated user
followers=$(curl -s -H "Authorization: Bearer $ACCESS_TOKEN" https://code.connected.bmw/api/user/followers | jq -r '.[].login')

# Step 2: Get followers of each follower
for follower_username in $followers; do
    echo "Followers of $follower_username:"
    curl -s -H "Authorization: Bearer $ACCESS_TOKEN" "https://code.connected.bmw/api/users/$follower_username/followers" | jq -r '.[].login'
done
