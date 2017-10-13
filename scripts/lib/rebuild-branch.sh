BRANCH="$1"

# Start by getting the latest version of the official drupal image
docker pull drupal:"$BRANCH"
# Rebuild the entire thing
docker build --no-cache -t dcycle/drupal:"$BRANCH" .
docker build -t dcycle/drupal:"$BRANCH".$DATE .
docker login -u"$DOCKERHUBUSER" -p"$DOCKERHUBPASS"
docker push dcycle/drupal:"$BRANCH"
docker push dcycle/drupal:"$BRANCH"."$DATE"