FROM ruby:3.3.7

RUN apt-get update && apt-get install -y \
    build-essential \
    libssl-dev \
    ruby-dev \
    && rm -rf /var/lib/apt/lists/*


WORKDIR /app

COPY . .

RUN ruby extconf.rb

RUN make

CMD ["ruby", "day_5.rb"]