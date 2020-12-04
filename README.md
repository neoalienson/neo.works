## Setup hexo
   cd ./hexo-blog
   # required by mozjpeg
```# Mac
   brew install automake
   brew install libpng
```# Linux
   sudo apt install libpng-dev 
   sudo apt install auto-conf # required by hexo-all-minifier

   npm install

## Generate static site to hexo-blog to preview
    cd ./hexo-blog
    hexo server # start the local webserver to preview

## Deploy to production
After the static site generates, copy content from ./hexo-blog/public to ./public
Then run `firebase deploy` to deploy to my production
only files in ./public will be uploaded

### Deploy web Only
`firebase deploy --only hosting`

### Deploy functions Only
`firebase deploy --only functions`

# Theme
git clone https://github.com/viosey/hexo-theme-material.git material

# Gource
## Gource for this repository
gource --user-image-dir . -c 3 -e 0.2 --key -o gource.ppm

## Convert to mp4 with libav
avconv -vcodec ppm -f image2pipe -i gource.ppm -c:v libx265 -c:a copy gource.mkv

# Use nodejs 10
nvm use v10
