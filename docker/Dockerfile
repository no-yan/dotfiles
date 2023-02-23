FROM ubuntu
WORKDIR /app
COPY . .

RUN   apt update && apt upgrade -y && \
      apt install curl -y &&\
      apt install build-essential procps curl file git -y && \
      /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

RUN sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply no-yan
