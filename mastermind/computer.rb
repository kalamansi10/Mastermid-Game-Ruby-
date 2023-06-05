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
        self.possible_solutions = valid_combinations.uniq
    end
    def one_correct(guess)
        valid_combinations = []
        guess.chars.each_with_index do |g_num, g_ind| 
            possible_solutions.each do |combination|
                comb_num = combination.to_s.chars
                valid_combinations << combination if comb_num[g_ind] == g_num
            end
        end
        self.possible_solutions = valid_combinations.uniq
    end
end










