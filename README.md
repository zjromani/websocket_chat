## Overview

This is a very basic chat app with [Action Cable](https://guides.rubyonrails.org/v5.0/action_cable_overview.html) and [Turbo Links](https://github.com/turbolinks/turbolinks).

## To Run

`bundle install`

`rails db:setup`

`rails s`

By running `rails db:setup` you will get your local database seeded with some random users and two ChatRooms.

Open `http://localhost:3000/` in your browser and in an incognito browser. Join a ChatRoom to chat and see messages appear in real time.

Sessions are managed with cookies. You will be assigned a random user if `cookies['user']` is empty.

## ToDo

- Rename `Message#message` column as it is confusing to do things like `message.message`
- Add specs for 'Channels' since Rails 6 supports that out of the box now.
- Authentication and basic user management.
- Websockets to handle "someone is typing".
- Websockets to handle people joining and leaving ChatRooms.
- Better Styling.
