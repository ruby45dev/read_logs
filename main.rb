puts 'Введіть логін до FTP'
user_login = gets.chomp

puts 'Введіть пароль до FTP'
user_password = gets.chomp

path_error_log = " " #вказую шлях до файлу

if File.exist?(path_error_log)   

    file_log = File.open(path_error_log, "a+")
    file_log_lines = file_log.readlines
    anny = []
    not_anny = []
    new =
        file_log_lines.each do |item_tmp|
            if item_tmp.include?('Warning')
                anny << item_tmp
            else
                not_anny << item_tmp
            end
        end

    file_new = File.open("#{__dir__}/sandbox1.txt", "a")
    file_new.puts anny
else
    puts "У цій деректорії файл відсутній"
end
