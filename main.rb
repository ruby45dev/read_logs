user = "" #ім'я користувача сервера
host = "" #ip адреса або домен
remote_file = "" #шлях до віддаленого файлу
local_destination = "" # шлях до каталогу для розташування скачаного файлу

result = system("scp #{user}@#{host}:#{remote_file} #{local_destination}")

if result
  puts "Файл успішно отримано"
else
  puts "Помилка під час отримання файлу"
end

path_error_log = "" #вказую шлях до файлу

if File.exist?(path_error_log)

    file_log = File.open(path_error_log, "a+")
    file_log_lines = file_log.readlines
    errors = []
    infos = []
    others = []
    file_log_lines.each do |item_tmp|
        if item_tmp.include?('ERROR:')
            errors << item_tmp
        elsif item_tmp.include?('INFO:')
            infos << item_tmp
        else
            others << item_tmp
        end
    end

    file_errors = File.open("#{__dir__}/errors.txt", "a")
    file_errors.puts errors

    file_infos = File.open("#{__dir__}/infos.txt", "a")
    file_infos.puts infos

    file_others = File.open("#{__dir__}/others.txt", "a")
    file_others.puts others
else
    puts "У цій деректорії файл відсутній"
end
