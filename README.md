# Toy App

A small Rails app built while working through Michael Hartl's
[*Ruby on Rails Tutorial*](https://www.railstutorial.org/) — specifically the
"toy app" chapter, which builds a scaffolded `Users` / `Microposts` app to get
a feel for the full Rails request cycle (models, controllers, views, routing,
migrations) before the tutorial's real sample app is introduced.

## What's here

- **Users** (`name`, `email`) — validated for presence.
- **Microposts** (`content`, belongs to a `User`) — validated for presence
  and a 140-character length limit.
- A `User has_many :microposts` / `Micropost belongs_to :user` association.
- Standard scaffolded CRUD controllers and views for both resources.
- `root` routes to `users#index`.

## Requirements

- Ruby 3.4.10 (see `Gemfile`)
- SQLite3

## Setup

```bash
bundle install
bin/rails db:setup   # creates the db, loads the schema, and runs db/seeds.rb
```

`bin/rails db:setup` (or `db:seed` on its own) loads a few sample users and
microposts via `db/seeds.rb` so the app isn't empty on first load. Seeding is
idempotent — running it again won't create duplicates.

## Running

```bash
bin/rails server
```

Then visit <http://localhost:3000>.

## Tests

```bash
bin/rails test
```

## Notes

The `json` gem is pinned to `~> 2.9` in the `Gemfile`. `json` 3.x made
`JSON.parse`'s second argument keyword-only, which breaks
`activesupport`'s positional `JSON.parse(json, options)` call used when
decrypting the session cookie — every request after the first (i.e. every
request that sends the session cookie back) would 500. Pinning to the 2.x
line keeps that call working.
