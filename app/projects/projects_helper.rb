module ProjectsHelper

  def project_names
    project_names = @projects.map(&:name).join(', ')
    project_names.present? ? project_names : "no projects yet"
  end

end
