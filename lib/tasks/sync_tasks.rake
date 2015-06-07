namespace :sync do

  desc 'Launch the Shares sync'
  task :shares => :environment do
    SharesSyncService.new().perform
  end

end