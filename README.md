# Faker filter plugin for Embulk

TODO: Write short description here and embulk-filter-faker.gemspec file.

## Overview

* **Plugin type**: filter

## Configuration

- **columns**: description (Array, required)

## Example

```yaml
filters:
  - type: faker
    columns:
      - {name: name}
      - {email: email}
      - {tel: tel}
```


## Build

```
$ rake
```
