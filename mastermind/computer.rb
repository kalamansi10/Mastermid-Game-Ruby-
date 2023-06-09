class Computer
    attr_accessor :possible_solutions
    def initialize
        @possible_solutions = initial_filter
    end

    def generate_combination
        possible_solutions.sample
    end

    def initial_filter
        valid_combinations = []
        (1111..6666).each do |combination|
            next if combination.to_s =~ /[7890]/ # Skip numbers with 7, 8, 9, or 0
            valid_combinations << combination
        end
        valid_combinations
    end

    def one_secret(guess)
        valid_combinations = []
        guess.chars.each do |number|
            possible_solutions.each do |combination|
                count = combination.to_s.count(number.to_s)
                valid_combinations << combination if count == 1
            end
        end
        self.possible_solutions = valid_combinations.uniq - [guess.to_i]
    end
    def one_correct(guess)
        valid_combinations = []
        guess.chars.each_with_index do |number, num_in| 
            possible_solutions.each do |combination|
                comb_num = combination.to_s.chars
                valid_combinations << combination if comb_num[num_in] == number
            end
        end
        self.possible_solutions = valid_combinations.uniq - [guess.to_i]
    end
    def two_secret(guess)
        valid_combinations = []
        guess.chars.each_with_index do |number, num_in|
            guess.chars.each_with_index do |second_number, sec_num_in|
                if num_in != sec_num_in
                    possible_solutions.each do |combination|
                        count = (combination.to_s.chars & [number, second_number]).size
                        valid_combinations << combination if number == second_number && combination.to_s.chars.count(number) == 2 || count == 2
                    end
                end
            end
        end
        self.possible_solutions = valid_combinations.uniq - [guess.to_i]
    end
    def two_correct(guess)
        valid_combinations = []
        guess.chars.each_with_index do |number, num_in|
            guess.chars.each_with_index do |second_number, sec_num_in|
                if num_in != sec_num_in
                    possible_solutions.each do |combination|
                        stringed_comb_arr = combination.to_s.chars
                        valid_combinations << combination if number == stringed_comb_arr[num_in] && second_number == stringed_comb_arr[sec_num_in]
                    end
                end
            end
        end
        self.possible_solutions = valid_combinations.uniq - [guess.to_i]
    end
    def three_secret(guess)
        valid_combinations = []
        guess.chars.each_with_index do |number, num_in|
            guess.chars.each_with_index do |second_number, sec_num_in|
                if num_in != sec_num_in
                    guess.chars.each_with_index do |third_number, third_num_in|
                        if num_in != third_num_in && sec_num_in != third_num_in
                            possible_solutions.each do |combination|
                                stringed_comb_arr = combination.to_s.chars
                                first_condtion = [number, second_number, third_number].sort == [stringed_comb_arr[0], stringed_comb_arr[1], stringed_comb_arr[2]].sort
                                second_condtion = [number, second_number, third_number].sort == [stringed_comb_arr[1], stringed_comb_arr[2], stringed_comb_arr[3]].sort
                                third_condtion = [number, second_number, third_number].sort == [stringed_comb_arr[0], stringed_comb_arr[1], stringed_comb_arr[3]].sort
                                fourth_condtion = [number, second_number, third_number].sort == [stringed_comb_arr[0], stringed_comb_arr[2], stringed_comb_arr[3]].sort
                                valid_combinations << combination if first_condtion || second_condtion || third_condtion || fourth_condtion
                            end
                        end
                    end
                end
            end
        end
        self.possible_solutions = valid_combinations.uniq - [guess.to_i]
    end
    def three_correct(guess)
        valid_combinations = []
        guess.chars.each_with_index do |number, num_in|
            guess.chars.each_with_index do |second_number, sec_num_in|
                if num_in != sec_num_in
                    guess.chars.each_with_index do |third_number, third_num_in|
                        if num_in != third_num_in && sec_num_in != third_num_in
                            possible_solutions.each do |combination|
                                stringed_comb_arr = combination.to_s.chars
                                condition = number == stringed_comb_arr[num_in] && second_number == stringed_comb_arr[sec_num_in] && third_number == stringed_comb_arr[third_num_in]
                                valid_combinations << combination if condition
                            end
                        end
                    end
                end
            end
        end
        self.possible_solutions = valid_combinations.uniq - [guess.to_i]
    end
    def four_secret(guess)
        valid_combinations = []
        possible_solutions.each do |combination|
            valid_combinations << combination if combination.to_s.chars.sort == guess.chars.sort
        end
        self.possible_solutions = valid_combinations.uniq - [guess.to_i]
    end
end

comp_new = Computer.new















