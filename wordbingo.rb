# ビンゴカードの入力 #
S = gets.to_i
bingo_card = Array.new(S){ gets.split }
word_list  = bingo_card.flatten

# 単語の入力 #
N = gets.to_i
hit_words = Array.new(N){ gets.chomp }

hit_list = Array.new(S*S)
hit_words.each do |hit|
  if ix = word_list.find_index(hit)
    hit_list[ix] = true
  end
end

hit_card = hit_list.each_slice(S).to_a

## ビンゴ判定 ##

# 左上
left = Array.new(S){|i| hit_card[i][i] }.all?

# 右上
right = Array.new(S){|i| hit_card[i][-i-1] }.all?

# 横判定
width = hit_card.any?(&:all?)

# 縦判定
height = hit_card.transpose.any?(&:all?)

# 結果出力
if width || height || left || right
  puts "yes"
else
  puts "no"
end