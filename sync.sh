# utility and caches
rm -rf node_modules
rm -rf .husky

# folders
rm -rf apps/wfo-ui
rm -rf apps/wfo-ui-surf
rm -rf packages
rm -rf mkdocs
# root files
rm -f .editorconfig
rm -f .eslintrc.js
rm -f .gitignore
rm -f .npmrc
rm -f .prettierignore
rm -f .prettierrc
rm -f package.json
rm -f turbo.json
rm -f yarn.lock

git clone git@github.com:workfloworchestrator/orchestrator-ui-library.git /tmp/wfo

# copy folder
cp -r /tmp/gui/.husky .
echo "Copying apps"
cp -r /tmp/gui/apps/wfo-ui apps/
cp -r /tmp/gui/apps/wfo-ui-surf apps/
echo "Copying packages and docs"
cp -r /tmp/wfo/packages .
cp -r /tmp/wfo/mkdocs .

# copy root files
cp -v /tmp/gui/.editorconfig .
cp -v /tmp/gui/.eslintrc.js .
cp -v /tmp/gui/.gitignore .
cp -v /tmp/gui/.npmrc .
cp -v /tmp/gui/.prettierignore .
cp -v /tmp/gui/.prettierrc .
cp -v /tmp/gui/package.json .
cp -v /tmp/gui/turbo.json .
cp -v /tmp/gui/yarn.lock .
