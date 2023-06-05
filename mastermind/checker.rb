module Checker
    def game_mode_validator
        game_mode = gets.chomp
        if  game_mode == '1' or game_mode == '2'
            game_mode
        else
            display_game_mode_error
            game_mode_validator
        end
    end
    def name_validator
        input_name = gets.chomp
        if  input_name.length > 10 and input_name.length < 1
            display_input_name_error
            name_validator
        else
            input_name
        end
    end
    
    def code_validator(cm_name)
        cm_code = gets.chomp
        if cm_code.length == 4 && cm_code =~ /[1-6]/
            cm_code
        else
            display_invalid_solution(cm_name)
            code_validator(cm_name)
        end
    end

    def guess_validator(cb_name, guess_history)
        guess = gets.chomp
        if guess.length == 4 && guess =~ /[1-6]/
            guess_history << guess
            guess
        else
            display_invalid_guess(cb_name, guess_history)
            guess_validator(cb_name, guess_history)
        end
    end

    def guess_response(cb_name, guess, answer, guess_history)
        matching_keys = (guess.chars & answer.chars).size
        correct_arr = []
        guess.chars.each_with_index do |num, ind|
            correct_arr << num if guess[ind] == answer[ind]
        end
        correct_keys = correct_arr.size
        secret_keys = matching_keys - correct_keys
        display_response(cb_name, [correct_keys, secret_keys], guess_history)
        [correct_keys, secret_keys]
    end
end