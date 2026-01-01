FROM perl:5.40

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    libpq-dev \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY cpanfile /app/

RUN cpanm --notest --installdeps .

COPY . /app/

CMD ["perl", "script/mojo_books", "daemon", "--listen", "http://*:3000"]
