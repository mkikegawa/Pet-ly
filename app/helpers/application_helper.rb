module ApplicationHelper
  def full_title(title)
    title.blank? ? 'Pet.ly' : "Pet.ly | #{ title }"
  end
end
