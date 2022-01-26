class EventsController < ApplicationController
    before_action :authenticate_user!, except: [:index]

    def index
        @events = Event.all
    end

    def new
        @event = current_user.own_events.build
    end

    def create
        @event = current_user.own_events.build(own_event_params)
    
        respond_to do |format|
          if @event.save
            format.html { redirect_to events_url, notice: "Event was successfully created." }
            format.json { render :show, status: :created, location: @event }
          else
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @event.errors, status: :unprocessable_entity }
          end
        end
    end

    def show
      @event = Event.find(params[:id])
    end

    private

        def own_event_params
            params.require(:event).permit(:title, :description, :date)
        end
end
