module ApplicationHelper
  def page_title(page_title = '')
    base_title = '気分で決める別府温泉'

    page_title.empty? ? base_title : page_title + " | " + base_title
  end
end
