#!/bin/sh

# git clone git@github.com:neoalienson/neo.works.git .deploy
cd .deploy/hexo-blog

git pull

nvm use v5
npm install

# enable all_minifier and js_concator
# do not enable as it affects echarts
#sed -i.bak "s/all_minifier: false/all_minifier: true/" _config.yml
sed -i.bak "s/js_concator: false/js_concator: true/" _config.yml

hexo generate

# disable all_minifier and js_concator
sed -i.bak "s/all_minifier: true/all_minifier: false/" _config.yml
sed -i.bak "s/js_concator: true/js_concator: false/" _config.yml

rm -rf ../public
mv public ..
cd ..

firebase deploy --only hosting

# clean up after deploy
rm -rf public
git checkout public

cd ..
