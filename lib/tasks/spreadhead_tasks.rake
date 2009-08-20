require 'active_record/fixtures'    

namespace :spreadhead do
  desc "Export a set of fixtures from the current database pages"
  task :export => [:environment] do
    data = File.join(RAILS_ROOT, 'db', 'data')
    Dir.mkdir(data) unless File.exists?(data)
    Page.to_fixtures(data)
  end
      
  desc "Import a set of page fixtures into the current database (overwrites existing pages)"
  task :import => [:environment] do
    puts 'Importing fixtures' 
    Fixtures.create_fixtures("db/data/", 'pages')
  end
end
