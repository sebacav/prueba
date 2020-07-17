class PeopleController < ApplicationController
  # this is a middleware filter, witch call a method before other one
  before_action :set_person, only: [:show, :update, :destroy]

  # GET /people
  # this method show all people
  def index
    # this is like a 'select * from people' in SQL, but using ORM
    @people = Person.all 

    # render is the return of our method and at the same time help us to render the object
    render json: @people 
  end

  # GET /people/1
  # this method show only one person
  def show
    if @person
      render json: @person
    else
      # :not_found is the http status code 404
      render status: :not_found
    end
  end

  # POST /people
  # this method create a person given a json through the http body
  def create
    # if “Content-Type” header is set as “application/json” then ...
    if request.content_type == "application/json" 
      # Person.new is like a "Insert into People values ..." in SQL
      @person = Person.new(person_params)
      # .save is the commit to database
      if @person.save
        # :created is the http status code 201
        render json: @person, status: :created
      # :bad_request is the http status code 400
      else
        render json: @person.errors, status: :bad_request #:unprocessable_entity
      end
    else
      render status: :bad_request
    end
  end

  # PATCH/PUT /people/1
  # this method update a person given a json through the http body
  def update
    if request.content_type == "application/json"
      # .update is like a "update people set ..." in sql
      if @person.update(person_params)
        render json: @person
      else
        render json: @person.errors, status: :not_found
      end
    else
      render status: :bad_request
    end
  end

  # DELETE /people/1 <= 1 is the param
  # this method delete a person given the param in the path of url
  def destroy
    # .destroy is like a "delete from people ..."
    if @person.destroy
      # :ok is the http status code 200
      render status: :ok
    else
      render status: :not_found
    end
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # This is the filter called by before_action
    def set_person

      # this @person is used by :show, :update, :destroy, method in this controller
      # .find_by is used to find by a specific column in DB, in this case, nationalId
      if @person = Person.find_by(nationalId: params[:nationalId])
        @person
      else
        render status: :not_found
      end
    end

    # Only allow a trusted parameter "white list" through.
    # this is a filter that take from the body of http, an make the content a person object
    def person_params
      params.require(:person).permit(:nationalId, :name, :lastName, :age, :originPlanet, :pictureUrl)
    end
end