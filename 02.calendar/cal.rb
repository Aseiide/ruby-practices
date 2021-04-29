require "date"

# 今月の最初の日を求める
# 今月の最後の日を求める

# 日付を配列として入力
WEEK_TABLE = [
  [99, 99, 99, 99, 99, 99,  1,  2,  3,  4,  5,  6,  7],
  [ 2,  3,  4,  5,  6,  7,  8,  9, 10, 11, 12, 13, 14],
  [ 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21],
  [16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28],
  [23, 24, 25, 26, 27, 28, 29, 30, 31, 99, 99, 99, 99],
  [30, 31, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99],
]

year = Date.today.year
month = Date.today.mon
first_wday = Date.new(year, month, 1).wday #初日の曜日を取得
last_day = Date.new(year, month, -1).day
week = %w(月 火 水 木 金 土 日)
start = 6 - first_wday

WEEK_TABLE.each do |week|
  buf = ""
  week[start, 7].each do |day|
    if day > last_day
      buf << "   "
    else
      buf << sprintf("%3d", day)
    end
  end
  puts buf
end
