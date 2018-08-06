# aws

Unofficial AWS SDK integration for Crystal.

*Status*: This is still very much WIP (Work in Progress).

## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  aws:
    github: sdogruyol/aws
```

## Usage

### SQS

```crystal
require "aws"

KEY    = "your-aws-key"
SECRET = "your-aws-secret"
REGION = "eu-west-1"

client = Aws::Sqs::Client.new(REGION, KEY, SECRET)

# Create a queue first
client.create_queue("sqs-crystal")

# Send a message to previously created queue
client.send_message("sqs-crystal", "Hi from Crystal!")
```

## Contributing

1. Fork it (<https://github.com/sdogruyol/aws/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [sdogruyol](https://github.com/sdogruyol) Serdar Dogruyol - creator, maintainer

## Thanks

Thanks to [@taylorfinnell](https://github.com/taylorfinnell) for his work on https://github.com/taylorfinnell/awscr-signer
