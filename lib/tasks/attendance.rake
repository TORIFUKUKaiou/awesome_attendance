require 'csv'

namespace :attendance do
  task :output, [:event_id] => :environment do |_task, args|
    CSV.open("output.csv", "wb") do |csv|
      csv << ["大学名", "氏名", "ふりがな", "出欠"]
      event = Event.find(args[:event_id])
      Attendance.includes(:user).where(event: event).order('users.org_id').each do |a|
        csv << [a.user.org.name, a.user.name, '', '〇']
      end
    end
  end
end