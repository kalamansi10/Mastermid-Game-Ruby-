require_relative 'checker'
require_relative 'codebreaker'
require_relative 'codemaker'
require_relative 'computer'
require_relative 'display'

class Game
    include Display
    include Checker
attr_accessor :game_mode, :code_maker, :code_breaker
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
    def game_over(result)
        case result
        when 0
            display_cm_win(code_maker.name,code_maker.cb_code)
        when 1
            display_cb_win(code_breaker.name, code_maker.cb_code)
        end
    end
end

new_game = Game.new

