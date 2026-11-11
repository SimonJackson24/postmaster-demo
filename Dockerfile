# postmaster demo — flat artifact: bundled server + web static tar (emulator-proof)
FROM node:24-alpine
WORKDIR /app/apps/server
ENV NODE_ENV=production
COPY index.cjs static.tar package.json ./
EXPOSE 3100
HEALTHCHECK --interval=30s --timeout=5s CMD wget -qO- http://127.0.0.1:3100/api/meta || exit 1
CMD ["node", "index.cjs"]
