class Computer
    attr_accessor :possible_solutions, :possible_comb, :init_sol
    def initialize
        @possible_solutions = initial_filter
        @possible_comb = [[0, 1, 2, 3], [0, 1, 3, 2], [0, 2, 1, 3], [0, 2, 3, 1], [0, 3, 1, 2], [0, 3, 2, 1], [1, 0, 2, 3], [1, 0, 3, 2], [1, 2, 0, 3], [1, 2, 3, 0], [1, 3, 0, 2], [1, 3, 2, 0], [2, 0, 1, 3], [2, 0, 3, 1], [2, 1, 0, 3], [2, 1, 3, 0], [2, 3, 0, 1], [2, 3, 1, 0], [3, 0, 1, 2], [3, 0, 2, 1], [3, 1, 0, 2], [3, 1, 2, 0], [3, 2, 0, 1], [3, 2, 1, 0]]
        @init_sol = ['1122', '1133', '1144', '1155', '1166', '2211', '2233', '2244', '2255', '2266', '3311', '3322', '3344', '3355', '3366', '4411', '4422', '4433', '4455', '4466', '5511', '5522', '5533', '5544', '5566', '6611', '6622', '6633', '6644', '6655']

    end

    def generate_comb
        possible_solutions.sample
    end

    def init_comb
        init_sol.sample
    end

    def initial_filter
        valid_combs = []
        ("1111".."6666").each do |comb|
            next if comb.to_s =~ /[7890]/ # Skip numbers with 7, 8, 9, or 0
            valid_combs << comb
        end
        valid_combs
    end

    def ultimate_filter(guess, response)
        valid_combs = []
        possible_solutions.each do |sample|
            valid_combs << sample if evaluator(guess, sample) == response
        end
        self.possible_solutions = valid_combs - [guess]
    end
    
    def evaluator(guess, sample)
        correct_keys = 0
        secret_keys = 0
        sample_copy = sample.dup
        guess.chars.each_with_index do |number, index|
            if number == sample_copy[index]
                correct_keys += 1
                sample_copy.chars[index] = nil
            elsif sample_copy.include?(number)
                secret_keys += 1
                sample_copy.chars[sample_copy.index(number)] = nil
            end
        end
        [correct_keys, secret_keys]
    end
end








