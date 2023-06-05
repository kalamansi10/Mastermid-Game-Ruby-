module Display
    def display_start_screen
        puts "\n\n\n\n\n\n\n\n\n\n



        Welcome to MASTERMIND!!!
        
        Type in '1' to play 'player vs player' or '2' for 'player vs comp'."
    end

    def display_input_cm_name(game_mode)
        puts "\n\n\n\n\n\n\n\n\n\n
        #{game_mode}




        What's your name codemaker?"
    end

    def display_input_cb_name(game_mode)
        puts "\n\n\n\n\n\n\n\n\n\n
        #{game_mode}




        What's your name codebreaker?"
    end

    def display_input_name_error
        puts "\n\n\n\n\n\n\n\n\n\n



        Name must be 1-10 characters only.
        
        Please try again."
    end

    def display_game_mode_error
        puts "\n\n\n\n\n\n\n\n\n\n
        


        Please select between '1' and '2'
        
        Type in '1' to play 'player vs player' or '2' for 'player vs comp'."
    end

    def display_input_solution(cm_name)
        puts "\n\n\n\n\n\n\n\n\n\n


        Codemaker #{cm_name}, please setup your code .

        Make a combination of four numbers from 1 to 6.
        
        \e[41m1# red\e[0m, \e[42m2# grn\e[0m, \e[43m3# ylw\e[0m, \e[44m4# blu\e[0m, \e[45m5# pnk\e[0m, \e[46m6# cyn\e[0m"
    end

    def display_invalid_solution(cm_name)
        puts "\n\n\n\n\n\n\n\n\n\n


        Make a combination of four numbers from 1 to 6.
        
        \e[41m1# red\e[0m, \e[42m2# grn\e[0m, \e[43m3# ylw\e[0m, \e[44m4# blu\e[0m, \e[45m5# pnk\e[0m, \e[46m6# cyn\e[0m
        
        Please try again #{cm_name}."
    end

    def display_invalid_guess(cb_name, guess_history)
        puts"\n\n\n\n\n\n\n\n\n\n
        Guest History: #{display_guess_history(guess_history)}


        Make a combination of four numbers from 1 to 6.

        \e[41m1# red\e[0m, \e[42m2# grn\e[0m, \e[43m3# ylw\e[0m, \e[44m4# blu\e[0m, \e[45m5# pnk\e[0m, \e[46m6# cyn\e[0m

        Please try again #{cb_name}."
    end

    def display_input_guess(cb_name, guess_history)
        puts"\n\n\n\n\n\n\n\n\n\n
        Guest History: #{display_guess_history(guess_history)}


        Turn #{guess_history.size + 1}. Codebreaker #{cb_name}, break the code.

        Guess a combination of four numbers from 1 to 6.

        \e[41m1# red\e[0m, \e[42m2# grn\e[0m, \e[43m3# ylw\e[0m, \e[44m4# blu\e[0m, \e[45m5# pnk\e[0m, \e[46m6# cyn\e[0m"
    end

    def display_response(cb_name, response, guess_history)
        puts"\n\n\n\n\n\n\n\n\n\n
        Guest History: #{display_guess_history(guess_history)}
        You got #{response[0]} correct key/s and #{response[1]} secret key/s.

        Turn #{guess_history.size + 1}. Codebreaker #{cb_name}, break the code.

        Guess a combination of four numbers from 1 to 6.

        \e[41m1# red\e[0m, \e[42m2# grn\e[0m, \e[43m3# ylw\e[0m, \e[44m4# blu\e[0m, \e[45m5# pnk\e[0m, \e[46m6# cyn\e[0m"
    end
    
    def display_cm_win(cm_name, answer)
        puts "\n\n\n\n\n\n\n\n\n\n
        


        #{answer} is the answer. #{display_code_interpreter(answer)}

        Codemaker #{cm_name} wins. Yay!!!"
    end 
    def display_cb_win(cb_name, answer)
        puts "\n\n\n\n\n\n\n\n\n\n
        


        #{answer} is the answer. #{display_code_interpreter(answer)}

        Codebreaker #{cb_name} wins. Yay!!!"
    end


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
            when 7
                color_comb_arr << "      "
            end
        end
        "|#{color_comb_arr[0]}, #{color_comb_arr[1]}, #{color_comb_arr[2]}, #{color_comb_arr[3]}|"
    end

    def display_guess_history(guess_history)
        guess_history_arr = []
        guess_history.each do |comb|
            guess_history_arr << display_code_interpreter(comb)
        end
        guess_history_arr.join(', ')
    end

end