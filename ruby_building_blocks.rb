class LearningRuby
    def self.caesar_cipher(to_encode, shift)
        encoded_string = ''
        min_upper = 65
        max_upper = 90
        min_lower = 97
        max_lower = 122

        to_encode.codepoints.to_a.each do |char|
            new_ascii = char + shift
            if char.between?(min_lower, max_lower) && new_ascii > max_lower
                diff = new_ascii - max_lower
                new_ascii = min_lower + diff - 1
            elsif char.between?(min_upper, max_upper) && new_ascii > max_upper
                diff = new_ascii - max_upper
                new_ascii = min_upper + diff - 1
            elsif char < (min_upper - 1) || char.between?(max_upper + 1, min_lower - 1) || char >(max_lower + 1)
                new_ascii = char
            end
            encoded_string << new_ascii.chr
        end
        puts encoded_string
    end

    def self.stock_picker(stock_prices)
        highest_diff = 0
        best_option = [-1, -1]

        stock_prices.each_with_index do |buy_price, buy_day|
            next_day = buy_day + 1
            stock_prices[next_day..-1].each_with_index do |sell_price, sell_day|
                if (sell_price - buy_price) > highest_diff
                    highest_diff = sell_price - buy_price
                    best_option[0] = buy_day
                    best_option[1] = sell_day + buy_day + 1
                end
            end
        end
        puts best_option
    end

    def self.substrings(search_string, dictionary)
        includes_dict = Hash.new
        dictionary.each do |substring|
            matches = search_string.downcase.scan(substring.downcase).size
            if matches > 0
                includes_dict[substring] = includes_dict[substring] ? includes_dict[substring] += matches : matches
            end
        end
        puts includes_dict
    end
end