git config --global pager.branch false

sudo apt update -y

sudo apt-get install jq -y

sudo apt install tree -y

docker run -d --network="host" -p 5000:5000 --restart=always --name registry registry:2

echo "You're good to go!"

