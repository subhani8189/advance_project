# Use the official, lightweight Nginx Alpine image as the base
FROM nginx:alpine

# Remove the default Nginx index page
RUN rm -rf /usr/share/nginx/html/*

# Copy all your website files from your current local directory 
# into the Nginx container's public HTML directory
COPY . /usr/share/nginx/html

# Expose port 80 so the container can receive web traffic
EXPOSE 80

# Start Nginx when the container launches
CMD ["nginx", "-g", "daemon off;"]