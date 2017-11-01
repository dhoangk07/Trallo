class LabelsController < ApplicationController
	def index
  	  @labels = Label.all
  end

  	def show
  	# @label = label.find(params[:id])
    @label = Label.find_by(id: params[:id])

	end

    def new
  	@label = Label.new
  	end

  	def create
  	# params
  	@label = Label.new(label_params)
  	if @label.save
  		redirect_to labels_path
  	else
  		render :new
  	end
 
  end
  
  	def edit
  	@label = Label.find(params[:id])
  	end
  
  	def destroy
  	  @label = Label.find(params[:id])
  	  @label.destroy
  	  redirect_to labels_path
  	end
 
  	def update
	  	@label = Label.find(params[:id])
	  	if @label.update_attributes(label_params)
	  		redirect_to label_path(@label)
	  	else
	  		render :edit
	  	end
    end

  	def label_params
  	  params.require(:label).permit(:name, :street, :address, :district)
  	end
 end