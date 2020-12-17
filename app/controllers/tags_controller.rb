class TagsController < ApplicationController
  before_action :authorize

  def index
    @tags = Tag.all
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tags_params)

    if @tag.save
      redirect_to tags_path, notice: "Etiqueta añadida correctamente."
    else
      render "new"
    end
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def update
    @tag = Tag.find(params[:id])

    if @tag.update(tags_params)
      redirect_to tags_path, notice: "Etiqueta editada correctamente."
    else
      render "edit"
    end
  end

  private

  def tags_params
    params.require(:tag).permit(:name)
  end
end
