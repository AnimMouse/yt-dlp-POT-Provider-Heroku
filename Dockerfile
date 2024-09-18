FROM node:20 AS build
RUN wget https://github.com/Brainicism/bgutil-ytdlp-pot-provider/archive/refs/heads/master.zip && unzip master.zip
WORKDIR /bgutil-ytdlp-pot-provider-master/server
RUN yarn install --frozen-lockfile
RUN npx tsc

FROM node:20-slim
WORKDIR /app
COPY --from=build /bgutil-ytdlp-pot-provider-master/server/build /app/build
COPY --from=build /bgutil-ytdlp-pot-provider-master/server/package.json /app/package.json
COPY --from=build /bgutil-ytdlp-pot-provider-master/server/yarn.lock /app/yarn.lock
RUN yarn install --production

COPY bgutil-ytdlp-pot-provider.sh .
CMD ["/app/bgutil-ytdlp-pot-provider.sh"]