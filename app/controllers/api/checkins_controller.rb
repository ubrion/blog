class Api::CheckinsController < ApiController
  def index
    @checkins = if params[:place_id]
                  Place.find(params[:place_id]).checkins.order(datetime: :desc)
                else
                  Checkin.includes(:place).order(datetime: :desc)
                end
  end

  def show
    @checkin = Checkin.find(params[:id])
  end

  def create
    checkin_data = checkin_params
    checkin_data[:datetime] = Time.parse(checkin_params[:datetime]).utc.iso8601

    @place = Place.find(params[:place_id])
    @checkin = @place.checkins.new(checkin_data)

    if @checkin.save
      render json: @checkin, status: :created, location: api_checkin_url(@checkin)
    else
      render json: @checkin.errors.full_messages, status: :unprocessable_entity
    end
  end

  private

  def checkin_params
    params.require(:checkin).permit(:datetime, :latitude, :longitude, :notes, :time_zone)
  end
end
