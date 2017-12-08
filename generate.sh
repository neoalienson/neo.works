#!/bin/sh
rm -rf public

cd hexo-blog
hexo generate

mv public ..
cd ..
