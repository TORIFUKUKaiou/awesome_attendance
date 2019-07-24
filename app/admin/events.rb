ActiveAdmin.register Event do
  permit_params :name, :date, :place_id

  member_action :download_attendance, :method => :get do
    csv = CSV.generate do |csv|
      csv << ["大学名", "氏名", "ふりがな", "出欠"]
      event = Event.find(params[:id])
      Attendance.includes(:user).where(event: event).order('users.org_id').each do |a|
        csv << [a.user.org.name, a.user.name, '', '〇']
      end
    end
    send_data csv, disposition: "attachment; filename=report.csv"
  end

  index do
    selectable_column
    id_column
    column :name
    column :place
    column :date
    column :created_at
    column :updated_at
    actions
    column do |e|
      link_to :download , download_attendance_admin_event_path(e.id)
    end
  end
end
