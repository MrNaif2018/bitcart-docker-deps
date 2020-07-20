
#!/bin/bash

SEPARATOR=$(expr index "$CIRCLE_TAG" "/")
NODE_NAME=${CIRCLE_TAG:0:$SEPARATOR-1}
if expr index "$CIRCLE_TAG" "-" > /dev/null; then
SEPARATOR_REVISION=$(expr index "$CIRCLE_TAG" "-")
REVISION="${CIRCLE_TAG:$SEPARATOR_REVISION}"
NODE_VERSION="${CIRCLE_TAG:$SEPARATOR:$SEPARATOR_REVISION-$SEPARATOR-1}"
else
REVISION=""
NODE_VERSION="${CIRCLE_TAG:$SEPARATOR}"
fi
LATEST_TAG="${CIRCLE_TAG:$SEPARATOR}"
DOCKERHUB_REPO="mrnaif/$NODE_NAME"
DOCKERHUB_REPO="${DOCKERHUB_REPO,,}"
DOCKERHUB_DESTINATION="$DOCKERHUB_REPO:$LATEST_TAG"

echo "LATEST_TAG=$LATEST_TAG"
echo "NODE_VERSION=$NODE_VERSION"
echo "REVISION=$REVISION"
echo "DOCKERHUB_REPO=$DOCKERHUB_REPO"
echo "DOCKERHUB_DESTINATION=$DOCKERHUB_DESTINATION"