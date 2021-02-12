require "csv"

p "1(新規でメモを作成) 2(既存のメモ編集する)"

memo_type = gets.to_i

if memo_type == 1
  p "拡張子を除いたファイルを記入してください"
elsif memo_type == 2
  p "編集したいファイル名を記入してください。"
else
  exit
end

# 1の場合
if memo_type == 1
  file_name = gets.to_s
  CSV.open(file_name,'w') do |csv|
  p "メモしたい内容を記入してください。"
  p "完了したらCtrl ＋ Dを押します。"
  file_boby = readlines
  csv.puts file_boby
  end
end

# ２の場合
if memo_type == 2
  file_name = gets.to_s
  p "▼ファイル内容"
  CSV.foreach(file_name) do |row|
    p row
  end

  p "追記したい内容を記入してください。"
  p "完了したらCtrl ＋ Dを押します。"
  CSV.open(file_name, "a") do |csv|
  file_boby = readlines
  csv.puts file_boby
  end
end