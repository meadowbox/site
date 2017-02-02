module ApplicationHelper
  def alert_icon(alert_type)
    case alert_type.to_sym
    when :danger
      "exclamation-triangle"
    when :success
      "star"
    else
      "flag"
    end
  end
end
