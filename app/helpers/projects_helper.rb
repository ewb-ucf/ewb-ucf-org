module ProjectsHelper
	def project_params
		params.require(:project).permit(:title, :category, :team_id, :about, :description, :status, :image, :user_ids => [], :donation_ids => [], :bloggable_ids => [])
	end
end
