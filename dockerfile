FROM ghcr.io/orange-opensource/hurl:6.0.0
WORKDIR /tests
COPY . .
ENTRYPOINT [ "hurl", "--variables-file", "./vars.env", "--test", "/tests", "--report-html", "/hurl-report" ]
