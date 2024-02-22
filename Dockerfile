# FROM node:18-alpine as builder
# COPY package.json .npmrc /tmp/build/
# RUN set -x \
#   && apk update \
#   && npm i -g pnpm \
#   && cd /tmp/build \
#   && npm install --omit dev \
#   &&  npx @lzwme/fed-lint-helper rm -f "node_modules/**/{license,LICENSE,README.md,readme.md,.*,*.d.ts,*.flow,*.map}"

FROM node:18-alpine As producton
LABEL maintainer="renxia <lzwy0820@qq.com>"

WORKDIR /app

COPY package.json .npmrc server.js ./
COPY public public
COPY tmp/node_modules node_modules

ENV TZ=Asia/Shanghai
# ENV DEBUG=0
ENV NODE_ENV=production
ENV PORT=8080
ENV NPM_REGISTRY_URL=https://registry.npmmirror.com
ENV ORIGIN=https://unpkg.com
ENV ENABLE_CLOUDFLARE=0
ENV CLOUDFLARE_EMAIL=''
ENV CLOUDFLARE_KEY=''

EXPOSE 8080/tcp

# RUN npm i -g pnpm --registry $NPM_REGISTRY_URL
# RUN pnpm install --prod --registry $NPM_REGISTRY_URL

RUN rm -rf /root/.cache \
    && rm -rf /root/.pnpm-store \
    && rm -rf /root/.local/share/pnpm/store/v3/files

ENTRYPOINT [ "node", "server.js"]
