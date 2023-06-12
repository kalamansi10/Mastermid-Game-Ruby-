require_relative 'checker'
require_relative 'codebreaker'
require_relative 'codemaker'
require_relative 'computer'
require_relative 'display'

class Game
    include Display
    include Checker
attr_accessor :game_mode, :code_maker, :code_breaker, :computer, :computer_guess
    def initialize
        display_start_screen
        gm = game_mode_validator
        case gm
        when "1"
            @game_mode = "Player vs Player"
            display_input_cm_name(game_mode)
            @code_maker = CodeMaker.new(name_validator)
            display_input_cb_name(game_mode)
            @code_breaker = CodeBreaker.new(name_validator)
            player_vs_player
        when "2"
            @game_mode = "Computer vs Player"
            @computer = Computer.new
            display_vs_computer_mode(game_mode)
            vs_computer_mode = game_mode_validator
            case vs_computer_mode
            when "1"
                @code_breaker = CodeBreaker.new("Computer")
                display_input_cm_name(game_mode)
                @code_maker = CodeMaker.new(name_validator)
                display_input_solution_vs_comp_cb(code_maker.name)
                gets.chomp
                @computer_guess = computer.init_comb
                pvc_cb_game_loop
            when "2"
                @code_maker = CodeMaker.new("Computer")
                display_input_cb_name(game_mode)
                @code_breaker = CodeBreaker.new(name_validator)
                code_maker.cb_code = computer.generate_comb
                display_input_guess(code_breaker.name, code_breaker.guess_history)
                pvp_game_loop
            end
        end
    end

    def player_vs_player
        display_input_solution(code_maker.name)
        code_maker.cb_code = code_validator(code_maker.name)
        display_input_guess(code_breaker.name, code_breaker.guess_history)
        pvp_game_loop
    end

    def pvp_game_loop
        if code_breaker.guess_history.size == 11
            game_over(0)
        else
            guess = guess_validator(code_breaker.name, code_breaker.guess_history)
            if guess == code_maker.cb_code
                game_over(1)
            else 
                guess_response(code_breaker.name, guess, code_maker.cb_code, code_breaker.guess_history)
                code_breaker.guess_history.size
                pvp_game_loop
            end
        end
    end

    def pvc_cb_game_loop
        if code_breaker.guess_history.size == 11
            game_over(3)
        else
            display_comp_cb_correct(computer_guess, code_breaker.guess_history)
            correct_num = gets.chomp
            display_comp_cb_secret(computer_guess, code_breaker.guess_history)
            secret_num = gets.chomp
            response = response_validator(correct_num, secret_num)
            if response == [4,0]
                game_over(2)
            elsif response == "invalid"
                display_invalid_response
                gets.chomp
                pvc_cb_game_loop
            else
                guess = self.computer_guess
                code_breaker.guess_history << guess
                p code_breaker.guess_history
                computer.ultimate_filter(guess, response)
                self.computer_guess = computer.generate_comb
                pvc_cb_game_loop
            end
        end
    end
    def game_over(result)
        case result
        when 0
            display_cm_win(code_maker.name,code_maker.cb_code)
        when 1
            display_cb_win(code_breaker.name, code_maker.cb_code)
        when 2
            display_cb_win_vs_comp(code_maker.name)
        when 3
            display_comp_win_vs_cb(code_maker.name)
        end
    end
end

new_game = Game.new

