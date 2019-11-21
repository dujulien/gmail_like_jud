class EmailsController < ApplicationController

	def index 
		@emails = Email.all
	end

	def create
		@email = Email.new(object: Faker::Book.title, body: Faker::ChuckNorris.fact, read: false)
		@email.save
		respond_to do |format|
			format.html {redirect_to emails_path}
			format.js {}
		end
	end


	def show
		@email = Email.find(params[:id])
		respond_to do |format|
			format.html {redirect_to email_path(@email.id)}
			format.js {}
		end
	end


  def update
    @email = Email.find(params[:id])
    if @email.read == false
      @email.read = true
    else
      @email.read = false
    end
    @email.update(email_params)
    respond_to do |format|
      format.html {redirect_to root_path}
      format.js {}
    end
  end


	def destroy
		@email = Email.find(params[:id])
    @email.destroy
    respond_to do |format|
      format.js {}
    end
	end

	private

  def email_params
    params.permit(:object, :body)
  end


end
