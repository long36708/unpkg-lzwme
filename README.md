# UNPKG (中文版)

**此分支的目标是:**

* 更易于自托管 Unpkg
* 保持与上游兼容
* 保持依赖项更新
* 不进行功能更改或添加新功能

------

[UNPKG](https://unpkg.com) 是一个快速、全球性的[内容分发网络](https://en.wikipedia.org/wiki/Content_delivery_network)，提供 npm 上的所有内容。

## 开发

准备工作:

```bash
git clone https://github.com/lzwme/unpkg.git
cd unpkg
pnpm i
cp .env.sample .env.local # 编辑 env.local 配置用于本地开发
```

开发模式:

```bash
pnpm watch
pnpm serve
```

## 构建和部署

```bash
cp .env.sample .env.prod # 编辑 env.prod 配置用于生产环境
set NODE_ENV=production # 或 staging
pnpm build
pnpm pack
```

将会生成一个类似 `unpkg-<version>.tgz` 的文件。
使用 pm2 在您的服务器上部署:

```bash
tar zxvf unpkg-<version>.tgz
cd package
npm i --omit dev
# pnpm i -P
pm2 -n unpkg start.js
```

## 使用 Docker

```bash
docker pull lzwme/unpkg
docker run -d -p 8080:8080 -e NPM_REGISTRY_URL=https://registry.npmjs.org -e ORGIN=* lzwme/unpkg
```

## 使用 `.env[.prod|.local]` 配置

更多详情请查看 [.env.sample](./.env.sample) 文件。

```yaml
# 私有 registry url 配置
NPM_REGISTRY_URL=https://registry.npmjs.org

# 您的 unpkg 网站 url
ORIGIN=https://npmcdn.lzw.me
# 监听端口，默认为 8080
PORT=8080

# 启用调试
# DEBUG=1

# Google Analytics MEASUREMENT_ID，可以设置为空来禁用它
GTAG_MEASUREMENT_ID=UA-140352188-1

# ENABLE_CLOUDFLARE=1
# CLOUDFLARE_EMAIL=test@lzw.me
# CLOUDFLARE_KEY=test
```

## 环境变量说明

- `ORIGIN`: 设置 unpkg 服务的基础 URL，默认为 `https://unpkg.com`，可用于自定义部署域名
- `NPM_REGISTRY_URL`: npm registry 地址，默认为 `https://registry.npmjs.org`
- `PORT`: 服务监听端口，默认为 8080
- `DEBUG`: 启用调试模式
- `GTAG_MEASUREMENT_ID`: Google Analytics ID，用于网站分析
- `ENABLE_CLOUDFLARE`: 启用 Cloudflare 集成
- `CLOUDFLARE_EMAIL`: Cloudflare 账户邮箱
- `CLOUDFLARE_KEY`: Cloudflare API 密钥

## 文档

请访问 [UNPKG 官方网站](https://unpkg.com) 了解更多使用方法。

## 赞助商

我们的赞助商和捐助者列表在 [SPONSORS.md](SPONSORS.md) 文件中。