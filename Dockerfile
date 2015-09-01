FROM node:slim

RUN apt-get update
RUN apt-get install -y git python build-essential

RUN git clone https://github.com/CharlieHess/slack-poker-bot.git /poker/

COPY entrypoint.sh /poker/
COPY token.txt /poker/

RUN npm install /poker/

WORKDIR /poker/
RUN npm install babel \
	underscore-plus \
	rx \
	slack-client \
	poker-evaluator \
	text-table \
	lwip \
	imgur \
	promisify-node \
	uuid

CMD ["/poker/entrypoint.sh"]