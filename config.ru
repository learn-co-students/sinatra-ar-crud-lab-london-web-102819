
require './config/environment'
  use Rack::MethodOverride

  run ApplicationController
  use ArticlesController
begin
  fi_check_migration
rescue ActiveRecord::PendingMigrationError => err
  STDERR.puts err
  exit 1
end
