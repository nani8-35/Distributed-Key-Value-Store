FROM ubuntu:20.04

# Avoid user interaction during install
ENV DEBIAN_FRONTEND=noninteractive

# Install build tools
RUN apt update && \
    apt install -y g++ make cmake

# Create app directory
WORKDIR /app

# Copy all files to container
COPY . .

# Build the project using Makefile (or cmake if needed)
RUN make

# Start the coordinator (can change to ./node <port>)
CMD ["./coordinator"]