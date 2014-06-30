module EventsHelper
	def event_params
		params.require(:event).permit(:title, :description, :infolink, :image, :category, :date, :location, :user_ids => [])
	end
end