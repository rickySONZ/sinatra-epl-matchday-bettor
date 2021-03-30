require "./config/environment"

use Rack::MethodOverride #supports patch and delete

use FollowsController
use ScoreboardController
use UsersController
use SessionsController
run ApplicationController