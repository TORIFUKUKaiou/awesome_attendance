class Api::V1::AttendancesController < Api::V1::ApiController
  def create
    attendance = Attendance.new(create_params)
    if attendance.save
      render json: { org: attendance.user.org.name, name: attendance.user.name }
    else
      render json: {}, status: :bad_request
    end
  end

  private

  def create_params
    create_params = params.require(:attendance).permit(:code, :place_id)
    create_params[:user] = User.find_by(code: create_params[:code])
    place = Place.find(create_params[:place_id])
    create_params[:event] = Event.where(place: place).where(date: Time.zone.now).first
    create_params
  end
end
