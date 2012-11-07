## Experts On Hand

  Well this was fun! I completely glossed over the solution and went straight
  on to an over-featured.. thing. But at least it is something to look at.

  The source can be found on github at
  [rmg/experts-on-hand](http://github.com/rmg/experts-on-hand)
  and a running demo can be found on Heroku at
  [experts-on-hand.herokuapp.com](http://experts-on-hand.herokuapp.com/). The demo is running on a free instance, so forgive the lag if you're the
  first visitor in the last 20 minutes.

### Setup

  This is a basic Rails app with 2 models, 1 minimal controller, and no
  resourceful routes. What is that, Sinatra on Rails?

*   Postgres because it is easy to use with Heroku
*   RSpec because I'm more familiar with it
*   Devise because it seemed the simplest way to get up and running
*   Bootstrap just because

  In order to actually run this bad boy, you'll want to set some environment
  variables and copy the database.yml.example file. I suggest using foreman
  to run the app and putting your environment variables inside a .env file
  in the root direcotry of the app.

### The idea

  When I read the problem, I started thinking up how to solve it and ignored the
  given solution. So what I ended up with was a concept of checkins, where users
  would checkin and show up on a checkin board.

### Checkins

  The idea here is checkins are essentially log entries. The table will grow and
  grow and the displayed set will be limited by the query. This makes sense in
  almost any system because almost every system seems to grow to need logging. The
  only reason **not** to use a log style table is size constraints.

  Which is greater? The problem with prematurely optimizing for size? Or adding a
  YAGNI (you aint gonna need it) feature? Turns out logs are actually a little
  easier to test, being immutable and all.

### Alternatives

  So the obvious solution (the one given in the project description) is to just
  tac on a couple fields to the User model.

<dl>
  <dt>`last_seen_at`</dt>
  <dd>This mechanism could be modelled based on some measure of activity. Maybe a
  a button that says "I'm here!" that refreshes their last_seen_at timestamp. 
  There would need to be an expiry, which would happen to be exactly the margin
  of error with this approach.</dd>
  <dt>
    `status`
    `status_starts_at`
    `status_ends_at`
  </dt>
  <dd>
    Here's a good combo. The duration could be hidden from the user so that all
    they have is an "I'm here!" and an "I'm outta here!" button. Could use some
    JavaScript to pop up a little reminder to re-assert themselves. Status could
    be a string or an enum. Would be easy enough to make it a free-form string
    with a hand-full of pre-defined ones that have colours associated with them.
  </dd>
</dl>

### Future

<dl>
  <dt>Teams</dt>
  <dd>
    This is a neat idea. You organise the users into teams and then show how
    many members of a team are around. Instead of users showing up in the list,
    you'd have something like the group name with a (n/m) beside it indicating
    how many people on that team are around. This would likely start off as your
    average has_many/belongs_to relationship between a Team model and the existing
    User model.
  </dd>
  <dt>Skills</dt>
  <dd>
    From a data perspective, this is the same as turning teams into a HABTM (has
    and belongs to many) with the User model. The idea here would be to tag the
    users with various keywords or skills, and the "in/out board" would basically
    be a tag cloud of what expertise is on-hand at the moment. **I like tagging,
    so this is probably what I'd end up making.**
  </dd>
</dl>