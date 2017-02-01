
def file_to_hash

	#каждый раз на входе обнуляем хэш
	@hh={} 
	#и затем наполняем его из файла
	@input = File.open 'log.txt','r'
	#читаем весь файл строка за строкой
	 while (line=@input.gets)
		line.strip!		
		line=line.split(",")
		line[0].to_sym			
		@hh[line[0]]=line[1]
		
	end
	@input.close
end

def login_ 
	
	puts "*******LOGIN**********"	
	puts "Enter login: "; login=gets
	puts "Enter password: "; password=gets
	#обрезаем лишние символы и пробелы
	login.strip!
	password.strip!
	
	#ищем в хэше соответствия введеным данным
	@hh.each do |key,value|
	
		#если нашли, то входим в кабинет
		if @hh[login] == password		
			#трижды мигающий текст. для наглядности
			3.times do
				print "bingo!!!","\r";sleep 0.5
				print "        ","\r";sleep 0.5
			end
			exit	
		end
	end
	#если не нашли совпадений, выводим - access denied
	#трижды мигающий текст. для наглядности	
	3.times do
		print "Access denied!","\r";sleep 0.5
		print "                             ","\r";sleep 0.5
	end
enter
end

def registration 
	puts "===========REGISTRATION=================="
	puts "Enter your registration login: "; @new_login=gets;@new_login.strip!
	#проверяем хэш на совпадение введенному логину
	@hh.each do |key,value|
		
		if @hh[@new_login]
			#если такой логин уже существует/занят, сообщаем об этом, просим ввести другой
			#трижды мигающий текст. для наглядности
			3.times do
				print "login exists, try another one","\r";sleep 0.5
				print "                             ","\r";sleep 0.5
			end
			return registration
			
		else
			#если логин еще не существует/ не занят, продолжаем регистрацию, просим ввести пароль
			puts "Enter your registration password: "; @new_password=gets; @new_password.strip!
			
			#вносим данные в файл для сохранения
			
			file = File.open "log.txt","a"
			file.write "#{@new_login},#{@new_password}\n"
			file.close	
			file_to_hash
			puts "Registration confirmed."
			
			enter		
		end		
	end	
	
end
		

def enter
puts "(L)ogin or (R)egistration?: "; answer = gets.downcase; answer.strip!

	if answer == "l"
		login_ 
		elsif answer == "r"
		@hh[clone]=('klon')
		registration 
		else
			#трижды мигающий текст. для наглядности
			3.times do
				print "Didnt understand you. Try again","\r";sleep 0.5
				print "                               ","\r";sleep 0.5
			end
			return enter
	end
end

file_to_hash
enter 


#сообщаем, что регистрация успешно закончена
#			#трижды мигающий текст. для наглядности
#			3.times do
#				print "                                      ","\r";sleep 0.5
#				print "Registration confirmed. Want to login?","\r";sleep 0.5
#			end
#			puts; puts "(Y)es, (N)o : "; answer = gets.downcase.strip!
#			if answer =="n"
#				exit
#				elsif
#					login_
#			end				
			