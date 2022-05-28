#Assumes SSH is set up on local git with permissions to github org
#Also need an API key set up on github
#Need to manually iterate page number for orgs with >100 repos (100 per page max)

ORGNAME="insert-org-name-here"; API_TOKEN="insert-token-here"; PAGE=1

curl "https://api.github.com/orgs/$ORGNAME/repos?page=$PAGE&per_page=100" -H "Authorization: token $API_TOKEN" | grep -o 'git@[^"]*' | xargs -L1 git clone
