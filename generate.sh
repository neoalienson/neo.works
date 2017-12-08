#!/bin/sh
rm -rf public

cd hexo-blog
# enable all_minifier and js_concator
sed -i.bak "s/all_minifier: false/all_minifier: true/" _config.yml
sed -i.bak "s/js_concator: false/js_concator: true/" _config.yml
hexo generate
# disable all_minifier and js_concator
sed -i.bak "s/all_minifier: true/all_minifier: false/" _config.yml
sed -i.bak "s/js_concator: true/js_concator: false/" _config.yml

mv public ..
cd ..
