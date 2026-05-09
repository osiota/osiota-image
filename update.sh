#!/bin/bash

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

cd "${SCRIPT_DIR}" || exit 127

cd src/ || exit 127

npm-check-updates -u
npm audit fix

LAST_TAG=$(git describe --tags --abbrev=0 2>/dev/null)
if [ -z "$LAST_TAG" ]; then
  echo "No previous tags, proceeding with publish..."
elif git diff --quiet "$LAST_TAG"; then
  echo "No changes in $name since last tag ($LAST_TAG), skipping publish..."
  exit 0
fi

npm ci --ignore-scripts || exit 1

cd - || exit 127

git add .
git commit -m "chore: update dependencies"
git push

OSIOTA_VERSION="$(jq -r .dependencies.osiota src/package.json)"

if ! git tag -v "v${OSIOTA_VERSION}" >/dev/null 2>&1; then
  git tag "v${OSIOTA_VERSION}"
  git push --tags
fi
