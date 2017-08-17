module ApplicationHelper
  def nav_link(link_text, link_path)
    class_name = current_page?(link_path) ? 'active w3-bar-item w3-button w3-hover-white w3-margin-top' : 'w3-bar-item w3-button w3-hover-white w3-margin-top'
    link_to link_path do
      content_tag(:h3, :class => class_name) do
        link_text
      end
    end
  end
end
