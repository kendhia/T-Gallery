namespace :database do
  desc "TODO"
  task :import_list => :environment do
    puts "importing Feeds url list"
    SourcesList.save_list
  end

  desc "TODO"
  task :import_feeds => :environment do
    Feeds
  end

end
