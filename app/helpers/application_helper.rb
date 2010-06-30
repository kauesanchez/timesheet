# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def print_env
    unless ENV['RAILS_ENV']=='production'
      case ENV['RAILS_ENV']
        when 'development' then '[dev]'
        when 'test' then '[test]'
      end
    end
  end
  
  def grid_on_off
    unless ENV['RAILS_ENV']=='production'
      '<a href="javascript://" class="toggle_grid" style="position: fixed; z-index: 10; left: 6px; top: 8px;">grid on/off</a>
    	<div class="over_grid">&nbsp;</div>'
    end
  end
  
  def seconds_to_time(total_seconds)
      minutes = total_seconds.to_i / 60
      seconds = total_seconds.to_i % 60
      seconds = '0'+seconds.to_s if seconds < 10
      "#{minutes}:#{seconds}"
  end
  

end
