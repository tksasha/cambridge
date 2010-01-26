# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def hx
    returning result = "" do
      link_to 'Foo', root_url
    end
  end
end
