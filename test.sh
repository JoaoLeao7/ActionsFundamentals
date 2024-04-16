#!/bin/bash

ACCESS_TOKEN="YOUR_ACCESS_TOKEN"

# Step 1: Get the login of the first 10 followers
followers=$(curl -s -H "Authorization: Bearer $ACCESS_TOKEN" "https://code.connected.bmw/api/user/followers?per_page=10" | jq -r '.[].login')

# Step 2: For each follower, get the login of their first 10 followers
for follower_username in $followers; do
    echo "Followers of $follower_username:"
    followers_of_follower=$(curl -s -H "Authorization: Bearer $ACCESS_TOKEN" "https://code.connected.bmw/api/users/$follower_username/followers?per_page=10" | jq -r '.[].login')
    echo "$followers_of_follower"
    echo "---------------------"
done
