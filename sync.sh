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

git clone git@github.com:workfloworchestrator/orchestrator-ui-library.git /tmp/gui

# copy folder
cp -r /tmp/gui/.husky .
cp -r /tmp/gui/apps/wfo-ui apps/
cp -r /tmp/gui/apps/wfo-ui-surf apps/
cp -r /tmp/wfo/packages .
cp -r /tmp/wfo/mkdocs .

# copy root files
cp -r /tmp/gui/.editorconfig .
cp -r /tmp/gui/.eslintrc.js .
cp -r /tmp/gui/.gitignore .
cp -r /tmp/gui/.npmrc
cp -r /tmp/gui/.prettierignore
cp -r /tmp/gui/.prettierrc
cp -r /tmp/gui/package.json
cp -r /tmp/gui/turbo.json .
cp -r /tmp/gui/yarn.lock .
