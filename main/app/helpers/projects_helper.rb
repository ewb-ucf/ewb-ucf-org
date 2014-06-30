module ProjectsHelper
	def project_params
		params.require(:project).permit(:title, :team_id, :about, :description, :status, :image, :user_ids => [])
	end
end
