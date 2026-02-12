# Use official Nginx image
FROM nginx:alpine

# Clean default nginx contents
RUN rm -rf /usr/share/nginx/html/*

# Copy both Angular build outputs into their respective subfolders
# This assumes your Jenkins 'dist' folder contains 'DigiFacto' and 'DigiTrack'
COPY ./dist/DigiFacto /usr/share/nginx/html/DigiFacto
COPY ./dist/DigiTrack /usr/share/nginx/html/DigiTrack

# Copy custom Nginx config
COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf

# Expose port 80
EXPOSE 80

# Run Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
