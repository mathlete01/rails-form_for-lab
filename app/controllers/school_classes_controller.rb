class SchoolClassesController < ApplicationController

  def index
    @school_classes = SchoolClass.all
  end

  def show
    @school_class = SchoolClass.find(params[:id])
  end

  def new
    @school_class = SchoolClass.new
  end

  def create 
    @school_class = SchoolClass.create(sc_params(:title, :room_number)) 
    @school_class.save
    #redirect_to school_classes_path
    redirect_to school_class_path(@school_class)
  end

  def edit
  end

  def update
    @school_class.update(sc_params(:title, :room_number))
    redirect_to school_class_path
  end

  def destroy
    @school_class.destroy
    redirect_to school_classes_path
  end

  private

  def sc_params(*args)
    params.require(:school_class).permit(*args)
  end

end