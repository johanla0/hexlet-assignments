require 'csv'

namespace :hexlet do
  desc 'Import users'
  task :import_users, [:path] => :environment do |t, args|
    path = args[:path]
    csv_text = File.read(path)
    csv = CSV.parse(csv_text, headers: true)
    csv.each do |row|
      hash = row.to_hash
      hash['birthday'] = Date.strptime(hash['birthday'], '%m/%d/%Y')
      User.create!(hash)
    end
  end
end
