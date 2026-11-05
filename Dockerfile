
FROM httpd:2.4

# Copy the website into Apache's document root
COPY playbooks/files/index.html /usr/local/apache2/htdocs/index.html

# Apache listens on port 80
EXPOSE 80
