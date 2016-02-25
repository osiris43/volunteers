module ApplicationHelper
  def theme_stylesheet
    if user_signed_in?
      "mvptheme/mvpready-admin"
    else
      "mvptheme/mvpready-landing"
    end
  end
end
