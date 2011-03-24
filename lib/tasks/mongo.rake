#Update: As of version 2.0.0.beta.14 of mongoid, a stubbed rake task for db:test:clone is included.
#Currently version installed is 2.0.0.rc7 so the lines below are included.

namespace :db do
  namespace :test do
    task :prepare do
      # Stub out for MongoDB
    end
  end
end