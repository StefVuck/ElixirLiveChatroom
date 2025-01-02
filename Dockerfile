FROM elixir:1.14-alpine

# Install build dependencies
RUN apk add --no-cache build-base git

# Create app directory
WORKDIR /app

# Install hex package manager and rebar
RUN mix local.hex --force && \
    mix local.rebar --force

# Copy config files first
COPY mix.exs mix.lock ./
COPY config ./config

# Install dependencies
RUN mix deps.get

# Copy application files
COPY lib ./lib
COPY test ./test

# Set up static files
COPY priv ./priv
RUN mkdir -p priv/static
COPY test.html priv/static/
RUN cp deps/phoenix/priv/static/phoenix.js priv/static/

# Compile the application
RUN mix compile

# Expose port
EXPOSE 4000

# Set environment variables
ENV MIX_ENV=dev
ENV PORT=4000

# Start the Phoenix server
CMD ["mix", "phx.server"]