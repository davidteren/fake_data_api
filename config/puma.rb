# frozen_string_literal: true

# Puma can serve each request in a thread from an internal thread pool.
workers Integer(ENV['WEB_CONCURRENCY'] || 2)
threads_count = Integer(ENV['RAILS_MAX_THREADS'] || 5)
threads threads_count, threads_count

# Specifies the `port` that Puma will listen on to receive requests
port ENV['PORT'] || 3000

# Specifies the `environment` that Puma will run in
environment ENV['RACK_ENV'] || 'development'

# Bind to all network interfaces
bind 'tcp://0.0.0.0:' + (ENV['PORT'] || '3000')
