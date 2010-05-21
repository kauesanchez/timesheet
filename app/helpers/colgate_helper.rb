module ColgateHelper
    def time_in_seconds
       (Time.now - session[:start_time]).to_i
     end

     def print_time
       time = time_in_seconds
       minutes = time / 60
       seconds = time % 60
       seconds = '0'+seconds.to_s if seconds < 10
       "<span class='time'><span id='minutes'>#{minutes}</span>:<span id='seconds'>#{seconds}</span></span>"
     end
    end
