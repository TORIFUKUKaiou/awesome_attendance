ActiveAdmin.register Event do
  permit_params :name, :date, :place_id

  member_action :download_attendance, method: :get do
    event = Event.find(params[:id])
    result_csv = CSV.generate do |csv|
      csv << %w[大学名 氏名 ふりがな 出欠]
      Attendance.includes(:user).where(event: event).order('users.org_id').each do |a|
        csv << [a.user.org.name, a.user.name, '', '〇']
      end
    end
    filename = "#{event.date.strftime('%Y%m%d')}_#{event.name}_#{event.place.name}_attendance.csv"
    send_data result_csv, disposition: "attachment; filename=#{filename}"
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
      link_to :download, download_attendance_admin_event_path(e.id)
    end
  end
end
