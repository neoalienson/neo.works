#!/bin/sh

# git clone git@github.com:neoalienson/neo.works.git .deploy
cd .deploy/hexo-blog

rm themes/hexo-theme-hueman/_config.yml

git reset --hard
git pull
git submodule update --init --recursive
pwd
pushd themes/hexo-theme-hueman
git reset --hard
git apply ../../../hexo-blog-patch/0002-Add-terms-and-condition-to-footer.patch
git apply ../../../hexo-blog-patch/0001-Add-title-above-subtitle.patch
popd

cp themes/_config.yml themes/hexo-theme-hueman

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
