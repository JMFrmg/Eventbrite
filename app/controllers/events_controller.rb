class EventsController < ApplicationController
  before_action :ensure_login, only: [ :new, :create ]
  
  def home
  end

  def index
    @events = Event.all

  end

  def new
    @event = Event.new
  end

  def create
    @user = current_user
    @event = @user.authored_events.new(event_params)
    if @event.save
      flash[:notice] = "Votre événement a été enregistré!"
      redirect_to events_path
      @event.user_attendees << current_user
      @event.save
    else
      render action: 'new'
    end
  end

  def show
    @event = Event.find(params[:id])
    @user = User.find(@event.creator_id)
  end

  def destroy
    @event = Event.find(params[:id])
      @event.destroy
    redirect_to current_user
  end

   def attend
    @event = Event.find(params[:id])
    @event.user_attendees << current_user
    @event.save
    flash[:success] = "Vous êtes inscrit à l'événement !"
    redirect_to events_path
  end

  def event_params
    params.require(:event).permit(:name, :description, :date, :place)
  end
end