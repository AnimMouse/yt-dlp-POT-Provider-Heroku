# yt-dlp POT Provider on Heroku
Host your own [BgUtils POT Provider server](https://github.com/Brainicism/bgutil-ytdlp-pot-provider) for [yt-dlp](https://github.com/yt-dlp/yt-dlp) on Heroku.

> [!TIP]
> You can try to use my currently hosted server at `https://yt-dlp-pot.44444444.xyz`.

## Heroku Deployment
You need Heroku CLI.

1. Clone this repository.
2. Create an app on Heroku.

### Deploy by building it on Heroku's server
3. Set git remote to Heroku `heroku git:remote -a your-app-name`.
4. Set stack to container `heroku stack:set container -a your-app-name`.
5. Deploy to Heroku `git push heroku main`.

### Deploy by building it on your computer
You need Docker.

3. Build the image and push to Container Registry `heroku container:push web -a your-app-name`.
4. Release the image `heroku container:release web`.

## yt-dlp Usage
```sh
yt-dlp --extractor-args "youtube:getpot_bgutil_baseurl=https://your-app-name.herokuapp.com" https://www.youtube.com/watch?v=BaW_jenozKc
```