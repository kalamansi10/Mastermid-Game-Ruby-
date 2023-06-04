class Display
    def display_code_interpreter(number_comb)
        color_comb_arr = []
        number_comb.split("").to_a.each do |color_num|
            case color_num.to_i
            when 1
                color_comb_arr << "\e[41m1# red\e[0m"
            when 2
                color_comb_arr << "\e[42m2# grn\e[0m"
            when 3
                color_comb_arr << "\e[43m3# ylw\e[0m"
            when 4
                color_comb_arr << "\e[44m4# blu\e[0m"
            when 5
                color_comb_arr << "\e[45m5# pnk\e[0m"
            when 6
                color_comb_arr << "\e[46m6# cyn\e[0m"
            end
        end
        "|#{color_comb_arr[0]}, #{color_comb_arr[1]}, #{color_comb_arr[2]}, #{color_comb_arr[3]}|"
    end
end

disp = Display.new

puts disp.display_code_interpreter("1234")


