require "./config/environment"

use Rack::MethodOverride

use ScoreboardController
use UsersController
use SessionsController
run ApplicationController