FROM node:16.15.0-alpine
WORKDIR /usr/src/app



ARG USER=node

RUN apk --no-cache add \
    make        \
    gcc         \
    g++         \
    musl-dev    \
    binutils    \
    autoconf    \
    automake    \
    libtool     \
    pkgconfig   \
    check-dev   \
    file        \
    patch       \
    sudo

# 一般ユーザー追加
# php artisan でファイル作成時にrootで作成されるので
# ログイン後に’su docker’で利用
RUN echo "$USER ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/$USER \
    && chmod 0440 /etc/sudoers.d/$USER

USER node
