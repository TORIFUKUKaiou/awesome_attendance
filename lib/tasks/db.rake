require 'csv'
require 'set'

namespace :db do
  task :init, [:csv] => :environment do |_task, args|
    orgs = Set.new
    CSV.foreach(args[:csv], headers: true) do |row|
      orgs << row['org']
    end

    orgs.to_a.sort.each do |org|
      Org.create!(name: org)
    end

    CSV.foreach(args[:csv], headers: true) do |row|
      org = Org.find_by(name: row['org'])
      password = User.new_token
      user = User.new(org: org,
                      name: row['name'],
                      email: row['email'],
                      password: password,
                      password_confirmation: password)
      begin
        user.save!
      rescue StandardError => e
        p "#{e}: #{user.inspect}"
      end
    end
  end
end
