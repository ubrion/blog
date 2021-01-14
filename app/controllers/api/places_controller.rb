class Api::PlacesController < ApiController
  before_action :set_place, only: %i[show update destroy]

  def index
    @places = Place
              .select('id', 'name', 'latitude', 'longitude', 'notes')
              .by_distance(origin: [params[:latitude], params[:longitude]])

    render json: @places
  end

  def show
    render json: @place
  end

  def create
    @place = Place.new(place_params)

    if @place.save
      render json: @place, status: :created, location: api_places_url(@place)
    else
      render json: @place.errors, status: :unprocessable_entity
    end
  end

  def update
    if @place.update(place_params)
      render json: @place
    else
      render json: @place.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @place.destroy
  end

  private

  def place_params
    params.require(:place).permit(:name, :longitude, :latitude, :notes)
  end

  def set_place
    @place = Place.find(params[:id])
  end
end
