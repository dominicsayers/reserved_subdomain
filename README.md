# ReservedSubdomain
[![Gem Version](https://badge.fury.io/rb/reserved_subdomain.svg)](https://rubygems.org/gems/reserved_subdomain)
[![Gem downloads](https://img.shields.io/gem/dt/reserved_subdomain.svg)](https://rubygems.org/gems/reserved_subdomain)
[![Build Status](https://travis-ci.org/dominicsayers/reserved_subdomain.svg?branch=master)](https://travis-ci.org/dominicsayers/reserved_subdomain)
[![Maintainability](https://api.codeclimate.com/v1/badges/53c0395f76bc52f53b60/maintainability)](https://codeclimate.com/github/dominicsayers/reserved_subdomain/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/53c0395f76bc52f53b60/test_coverage)](https://codeclimate.com/github/dominicsayers/reserved_subdomain/test_coverage)
[![Dependency Status](https://dependencyci.com/github/dominicsayers/reserved_subdomain/badge)](https://dependencyci.com/github/dominicsayers/reserved_subdomain)
[![security](https://hakiri.io/github/dominicsayers/reserved_subdomain/master.svg)](https://hakiri.io/github/dominicsayers/reserved_subdomain/master)
[![Codacy Badge](https://api.codacy.com/project/badge/Grade/5aeeb051546b4ecc9f0c78317d8c6af8)](https://www.codacy.com/app/dominicsayers/reserved_subdomain)

ReservedSubdomain is a Ruby gem that checks whether a proposed subdomain should be a reserved name.

It checks for common patterns such as `www` or `mail`. It checks all gTLDs. It checks some common language and country codes.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'reserved_subdomain'
```

## Usage

```ruby
ReservedSubdomain.new('www').reserved? # => true
```

## Reserved subdomains

The actual subdomain names that are marked as reserved can be found in the text files in the [literals](https://github.com/dominicsayers/reserved_subdomain/tree/master/lib/reserved_subdomain/literals) directory.

## Configuration

Each time you use ReservedSubdomain it loads the list of reserved names from a file. This can be slow if you're doing these checks frequently.

In this case you can set the environment variable `RESERVED_SUBDOMAIN_PRELOAD` to "true" and the list will be preloaded.

Of course if you preload the list it will stay memory-resident and take up a significant amount of room. Your call.
