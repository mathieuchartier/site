#!/bin/sh
set -e
printf "Deploying..."
msg="Site update $(date)"

echo ""
echo "Committing internal changes"
cd public
git add .
git commit -m "$msg"
git push origin master

cd ..
echo ""
echo "Committing public changes"
git add .
git commit -m "$msg"
# git push origin master
git push
