## Setup hexo
   cd ./hexo-blog
   # required by mozjpeg
   brew install automake
   brew install libpng
   npm install

## Generate static site to hexo-blog to preview
    cd ./hexo-blog
    hexo generate
    hexo server # start the local webserver to preview

## Deploy to production
After the static site generates, copy content from ./hexo-blog/public to ./public
Then run `firebase deploy` to deploy to my production
only files in ./public will be uploaded

# Theme
git clone https://github.com/viosey/hexo-theme-material.git material
