class Computer
    attr_accessor :possible_solutions, :possible_comb
    def initialize
        @possible_solutions = initial_filter
        @possible_comb = [[0, 1, 2, 3], [0, 1, 3, 2], [0, 2, 1, 3], [0, 2, 3, 1], [0, 3, 1, 2], [0, 3, 2, 1], [1, 0, 2, 3], [1, 0, 3, 2], [1, 2, 0, 3], [1, 2, 3, 0], [1, 3, 0, 2], [1, 3, 2, 0], [2, 0, 1, 3], [2, 0, 3, 1], [2, 1, 0, 3], [2, 1, 3, 0], [2, 3, 0, 1], [2, 3, 1, 0], [3, 0, 1, 2], [3, 0, 2, 1], [3, 1, 0, 2], [3, 1, 2, 0], [3, 2, 0, 1], [3, 2, 1, 0]]
    end

    def generate_comb
        possible_solutions.sample
    end

    def initial_filter
        valid_combs = []
        ("1111".."6666").each do |comb|
            next if comb.to_s =~ /[7890]/ # Skip numbers with 7, 8, 9, or 0
            valid_combs << comb
        end
        valid_combs
    end

    def one_secret(guess)
        valid_combs = []
        possible_solutions.each do |sample|
            guess.chars.each do |secret_num|
                break if valid_combs.any?(sample)
                valid_combs << sample if sample.chars.count(secret_num) == 1
            end
        end
        self.possible_solutions = valid_combs - [guess]
    end
    def one_correct(guess)
        valid_combs = []
        possible_solutions.each do |sample|
            guess.chars.each_with_index do |correct_num, correct_index|
                break if valid_combs.any?(sample)
                valid_combs << sample if correct_num == sample.chars[correct_index] && sample.chars.count(correct_num) == 1
            end
        end
        self.possible_solutions = valid_combs - [guess]
    end
    def two_secret(guess)
        valid_combs = []
        possible_solutions.each do |sample|
            break if valid_combs.any?(sample)
            possible_comb.each do |comb|
                sample_one = sample.chars[comb[0]]
                sample_two = sample.chars[comb[1]]
                sample_three = sample.chars[comb[2]]
                sample_four = sample.chars[comb[3]]
                guess_one = guess.chars[comb[0]]
                guess_two = guess.chars[comb[1]]
                guess_three = guess.chars[comb[2]]
                guess_four = guess.chars[comb[3]]
                if [sample_one, sample_two].sort == [guess_one, guess_two].sort  && ([sample_three, sample_four] & [guess_three, guess_four]).size == 0
                    valid_combs << sample 
                    break
                end
            end    
        end
        self.possible_solutions = valid_combs - [guess]
    end
    def two_correct(guess)
        valid_combs = []
        possible_solutions.each do |sample|
            break if valid_combs.any?(sample)
            possible_comb.each do |comb|
                sample_one = sample.chars[comb[0]]
                sample_two = sample.chars[comb[1]]
                sample_three = sample.chars[comb[2]]
                sample_four = sample.chars[comb[3]]
                guess_one = guess.chars[comb[0]]
                guess_two = guess.chars[comb[1]]
                guess_three = guess.chars[comb[2]]
                guess_four = guess.chars[comb[3]]
                if [sample_one, sample_two] == [guess_one, guess_two]  && ([sample_three, sample_four] & [guess_three, guess_four]).size == 0
                    valid_combs << sample 
                    break
                end
            end    
        end
        self.possible_solutions = valid_combs - [guess]
    end
    def three_secret(guess)
        valid_combs = []
        possible_solutions.each do |sample|
            break if valid_combs.any?(sample)
            possible_comb.each do |comb|
                sample_one = sample.chars[comb[0]]
                sample_two = sample.chars[comb[1]]
                sample_three = sample.chars[comb[2]]
                sample_four = sample.chars[comb[3]]
                guess_one = guess.chars[comb[0]]
                guess_two = guess.chars[comb[1]]
                guess_three = guess.chars[comb[2]]
                guess_four = guess.chars[comb[3]]
                if [sample_one, sample_two, sample_three].sort == [guess_one, guess_two, guess_three].sort && sample_four != guess_four
                    valid_combs << sample 
                    break
                end
            end    
        end
        self.possible_solutions = valid_combs - [guess]
    end
    def three_correct(guess)
        valid_combs = []
        possible_solutions.each do |sample|
            break if valid_combs.any?(sample)
            possible_comb.each do |comb|
                sample_one = sample.chars[comb[0]]
                sample_two = sample.chars[comb[1]]
                sample_three = sample.chars[comb[2]]
                sample_four = sample.chars[comb[3]]
                guess_one = guess.chars[comb[0]]
                guess_two = guess.chars[comb[1]]
                guess_three = guess.chars[comb[2]]
                guess_four = guess.chars[comb[3]]
                if sample_one == guess_one && sample_two == guess_two && sample_three == guess_three && sample_four != guess_four
                    valid_combs << sample 
                    break
                end
            end    
        end
        self.possible_solutions = valid_combs - [guess]
    end
    def four_secret(guess)
        valid_combs = []
        possible_solutions.each do |sample|
            break if valid_combs.any?(sample)
            possible_comb.each do |comb|
                sample_one = sample.chars[comb[0]]
                sample_two = sample.chars[comb[1]]
                sample_three = sample.chars[comb[2]]
                sample_four = sample.chars[comb[3]]
                guess_one = guess.chars[comb[0]]
                guess_two = guess.chars[comb[1]]
                guess_three = guess.chars[comb[2]]
                guess_four = guess.chars[comb[3]]
                if [sample_one, sample_two, sample_three, sample_four].sort == [guess_one, guess_two, guess_three, guess_four].sort
                    valid_combs << sample 
                    break
                end
            end    
        end
        self.possible_solutions = valid_combs - [guess]
    end
    def one_crct_one_scrt(guess)
        valid_combs = []
        possible_solutions.each do |sample|
            break if valid_combs.any?(sample)
            possible_comb.each do |comb|
                sample_one = sample.chars[comb[0]]
                sample_two = sample.chars[comb[1]]
                sample_three = sample.chars[comb[2]]
                sample_four = sample.chars[comb[3]]
                guess_one = guess.chars[comb[0]]
                guess_two = guess.chars[comb[1]]
                guess_three = guess.chars[comb[2]]
                guess_four = guess.chars[comb[3]]
                first_condition = sample_one == guess_one && [sample_two, sample_three, sample_four].count(guess_two) == 1
                second_condtion = sample_two != guess_two && sample_three != guess_three && sample_four != guess_four
                if first_condition && second_condtion
                    valid_combs << sample 
                    break
                end
            end    
        end
        self.possible_solutions = valid_combs - [guess]
    end
    def one_crct_two_scrt(guess)
        valid_combs = []
        possible_solutions.each do |sample|
            break if valid_combs.any?(sample)
            possible_comb.each do |comb|
                sample_one = sample.chars[comb[0]]
                sample_two = sample.chars[comb[1]]
                sample_three = sample.chars[comb[2]]
                sample_four = sample.chars[comb[3]]
                guess_one = guess.chars[comb[0]]
                guess_two = guess.chars[comb[1]]
                guess_three = guess.chars[comb[2]]
                guess_four = guess.chars[comb[3]]
                first_condition = sample_one == guess_one && [sample_two, sample_three].sort == [guess_two, guess_three].sort
                second_condtion = sample_two != guess_two && sample_three != guess_three && sample_four != guess_four
                if first_condition && second_condtion
                    valid_combs << sample 
                    break
                end
            end    
        end
        self.possible_solutions = valid_combs - [guess]
    end
    def two_crct_one_scrt(guess)
        valid_combs = []
        possible_solutions.each do |sample|
            break if valid_combs.any?(sample)
            possible_comb.each do |comb|
                sample_one = sample.chars[comb[0]]
                sample_two = sample.chars[comb[1]]
                sample_three = sample.chars[comb[2]]
                sample_four = sample.chars[comb[3]]
                guess_one = guess.chars[comb[0]]
                guess_two = guess.chars[comb[1]]
                guess_three = guess.chars[comb[2]]
                guess_four = guess.chars[comb[3]]
                first_condition = sample_one == guess_one && sample_two == guess_two && [sample_three, sample_four].count(guess_three) == 1
                second_condtion = sample_three != guess_three && sample_four != guess_four
                if first_condition && second_condtion
                    valid_combs << sample 
                    break
                end
            end    
        end
        self.possible_solutions = valid_combs - [guess]
    end
    def one_crct_three_scrt(guess)
        valid_combs = []
        possible_solutions.each do |sample|
            break if valid_combs.any?(sample)
            possible_comb.each do |comb|
                sample_one = sample.chars[comb[0]]
                sample_two = sample.chars[comb[1]]
                sample_three = sample.chars[comb[2]]
                sample_four = sample.chars[comb[3]]
                guess_one = guess.chars[comb[0]]
                guess_two = guess.chars[comb[1]]
                guess_three = guess.chars[comb[2]]
                guess_four = guess.chars[comb[3]]
                if sample_one == guess_one && [sample_two, sample_three, sample_four].sort == [guess_two, guess_three, guess_four].sort
                    valid_combs << sample 
                    break
                end
            end    
        end
        self.possible_solutions = valid_combs - [guess]
    end
    def two_crct_two_scrt(guess)
        valid_combs = []
        possible_solutions.each do |sample|
            break if valid_combs.any?(sample)
            possible_comb.each do |comb|
                sample_one = sample.chars[comb[0]]
                sample_two = sample.chars[comb[1]]
                sample_three = sample.chars[comb[2]]
                sample_four = sample.chars[comb[3]]
                guess_one = guess.chars[comb[0]]
                guess_two = guess.chars[comb[1]]
                guess_three = guess.chars[comb[2]]
                guess_four = guess.chars[comb[3]]
                if sample_one == guess_one && sample_two == guess_two && [sample_three, sample_four].sort == [guess_three, guess_four].sort
                    valid_combs << sample 
                    break
                end
            end    
        end
        self.possible_solutions = valid_combs - [guess]
    end
end

comp_new = Computer.new
p comp_new.two_crct_two_scrt('1234').size
print comp_new.possible_solutions














