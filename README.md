# UnderArmour API

_note: new project, not yet published to ruby gems_

Ruby gem to utilize UnderArmour API, with simple methods to query and retrieve specific data for an authenticated user.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'underarmour_api'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install underarmour_api

## Usage

### Authentication

Request a `client_id` and `client_secret` for the UnderArmour API from their [developer site](https://developer.underarmour.com/docs/) under "Request a Key".
Once you store those values in a safe place, you can pass them through to the gem either in an initializer file, or by instantiating a client with those values manually:

**app/config/initializers/underaroumour_api.rb**
```ruby
UnderarmourApi.config do |config|
  config.client_id = ENV['UA_CLIENT_ID']
  config.client_secret = ENV['UA_CLIENT_SECRET']
end
```

or

`client = UnderarmourApi::Client.new(client_id: ENV['UA_CLIENT_ID'], client_secret: ENV['UA_CLIENT_SECRET'])`

Creating a client will then also set a client access code, to retrieve app-level data from the API. You can also add the access token directly in the initializer as well.

To retrieve a user access token, you will need to go through [UnderArmour's OAuth flow](https://developer.underarmour.com/docs/v71_OAuth_2/) to have the user authorize access to their data.
This process will require you to send your users via a link to UnderArmour's login page that will include a redirect uri and a `request_type` of 'code':

`https://www.mapmyfitness.com/v7.1/oauth2/authorize/?client_id=ENV[CLIENT_ID]&response_type=code&redirect_uri=REDIRECT_URI`

where your `REDIRECT_URI` might look like: `https://myapp.com/callback`

If the user login is successful, your app should capture the response the API will send with the redirect, which will include a code value in the params:

```ruby
def callback
  @code = params[:code]
end
```

You can then pass this code on to the client to fetch the authenticated user's access token like so:

`client.fetch_access_token(code: params[:code])`

### Resources

#### Users

You can fetch the authenticated user's data either by calling `client.user`, or by passing the client into `UnderarmourApi::User.me(client)`.

The authenticated user then has associated resources such as `profile_photos` and `workouts`.

Some of these resources can be filtered, for instance:

```ruby
  user = client.user
  user.profile_photo(:small) # >> returns the url for the small profile photo

  start_date = (DateTime.new(2017, 5, 21, 0, 0, 0)).iso8601
  user.workouts(started_after: start_date, order_by: start_datetime) # >> returns workouts that match the filter criteria
```

Check out the [developer docs](https://developer.underarmour.com/docs/) for available parameters for filtering resources such as workouts.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/inveterateliterate/underarmour_api.
This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the UnderarmourApi project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/inveterateliterate/underarmour_api/blob/master/CODE_OF_CONDUCT.md).

