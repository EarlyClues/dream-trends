#!/usr/bin/env ruby
RAKE = 'rake'

puts "***** Re-creating development database"
system("#{RAKE} db:drop")
system("#{RAKE} db:create")
migrate_cmd = "#{RAKE} db:migrate --trace"
system(migrate_cmd)

puts "***** Re-creating test database"
ENV['RAILS_ENV'] = 'test'
system("#{RAKE} db:drop")
system("#{RAKE} db:create")
migrate_cmd = "#{RAKE} db:migrate  --trace"
system(migrate_cmd)
