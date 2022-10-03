FROM ruby:2.6.3

RUN apt-get update \
    && apt-get install -y sqlite curl \
    postgresql postgresql-contrib \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN service postgresql start

# RUN systemctl start postgresql.service

ENV NODE_VERSION=12.22.12
RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
ENV NVM_DIR=/root/.nvm
RUN . "$NVM_DIR/nvm.sh" && nvm install ${NODE_VERSION}
RUN . "$NVM_DIR/nvm.sh" && nvm use v${NODE_VERSION}
RUN . "$NVM_DIR/nvm.sh" && nvm alias default v${NODE_VERSION}
ENV PATH="/root/.nvm/versions/node/v${NODE_VERSION}/bin/:${PATH}"
RUN node --version
RUN npm --version

RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# WORKDIR /usr/src/app

RUN npm install --global yarn

RUN gem install bundler rails:6.0.2.1

# RUN rm yarn.lock package-lock.json
# RUN yarn cache clean 
# RUN yarn install --check-files

# RUN rails webpacker:install

WORKDIR /usr/src/app

COPY entrypoint.sh /usr/local/bin

RUN ["chmod", "+x", "/usr/local/bin/entrypoint.sh"]

ENTRYPOINT ["entrypoint.sh"]

EXPOSE 3000
EXPOSE 3035
EXPOSE 587

CMD ["rails", "server", "-b", "0.0.0.0"]