An Ubuntu Trusty Docker image for local development.

Main ingredients:
- [Puppet 4.2.2](https://puppetlabs.com/puppet/puppet-open-source)
- [puppetlabs-aws](https://forge.puppetlabs.com/puppetlabs/aws) module
- [awscli](https://aws.amazon.com/cli/)

## Build

```bash
docker build -t puppet .
```

## Run

```bash
docker run -e "AWS_REGION=eu-central-1" \
           -v "$HOME/.aws:/root/.aws" \
           -v "$(pwd):/src" \
           puppet \
           puppet apply /src/init.pp
```
