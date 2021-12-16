#Build_Phase

FROM node:alpine as builder

WORKDIR '/app'

#Download and install dependencies

COPY ./package.json ./

RUN npm install

COPY ./ ./

#Run command when container starts
#RUN npm run build
CMD ["npm", "run", "build"]       

#Server_Phase

FROM nginx

EXPOSE 80

COPY --from=builder /app/build /usr/share/nginx/html






