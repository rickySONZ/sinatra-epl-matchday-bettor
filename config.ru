require "./config/environment"

use Rack::MethodOverride

use FollowsController
use ScoreboardController
use UsersController
use SessionsController
run ApplicationController