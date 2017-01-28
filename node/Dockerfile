FROM node:6.9.1

RUN npm install nrm cnpm pm2 -g
RUN nrm add ddys http://npm.dingdingyisheng.mobi/
RUN nrm use ddys
# RUN echo "Everything Done."
EXPOSE 5200
CMD ["node"]
