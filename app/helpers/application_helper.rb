module ApplicationHelper
    def user_logged_in?
      logged_in?
    end

    def flash_background_color(type)
      case type.to_sym
      when :notice
        "bg-blue-300 border-l-4 border-blue-500 text-blue-700 p-4"
      when :alert
        "bg-red-500 border-l-4 border-red-700 text-red-100 p-4"
      else "bg-gray-500"
      end
    end

    def page_title(title)
      base_title = "恥ずかしさを笑いに！！"
      title.empty? ? base_title : title + " | " +  base_title
    end
  end
