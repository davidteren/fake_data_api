# Fake Data API

![CI](https://github.com/[your-username]/[repo-name]/workflows/CI/badge.svg)

A Sinatra-based API that generates fake data using the Faker gem. Perfect for testing and development purposes.

## Features

- Generate single fake person data
- Generate multiple fake people (up to 10)
- Includes personal information, addresses, and company details
- Modern UI with Tailwind CSS
- Comprehensive API documentation

## Requirements

- Ruby 3.0 or higher
- Bundler

## Setup

1. Clone the repository:
```bash
git clone [your-repo-url]
cd [repo-name]
```

2. Install dependencies:
```bash
bundle install
```

3. Run the server:
```bash
ruby app.rb
```

4. Visit http://localhost:4567 in your browser

## API Endpoints

- `GET /api/person` - Get a single person's data
- `GET /api/people/:count` - Get multiple people's data (max 10)

## Development

### Running Tests

```bash
ruby test/app_test.rb
```

### Code Style

We use RuboCop for code style checking:


```bash
bundle exec rubocop
```

## CI/CD

This project uses GitHub Actions for:
- Running tests across multiple Ruby versions
- Code style checking with RuboCop
- Security audits with bundler-audit
- Automated deployment (when configured)

## License

MIT
