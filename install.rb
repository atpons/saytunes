loop do
  system("clear")
  puts "Install say2.rb"
  puts "from https://gist.github.com/2011415"
  puts "======================================"
  puts "Are you want to install say2.rb? (y/n)"
  puts "======================================"
  confim = gets.to_s.chomp
  puts "======================================"
  detect = system("ls ./2011415/say2.rb")
  case confim
  when "y"
    puts "======================================"
    case detect
    when true
      puts "say2.rb is exists!"
      puts 'You must delete "/2011415" and "/2011415/say2.rb".'
      puts "======================================"
      puts 'Notice:"say2.rb" default speaker is "Tom."'
      puts "So can not be used in the state now, "
      puts "please change it to the default speakers such as Alex."
      puts "======================================"
      exit()
    when false
      puts "Cloneing..."
      puts "======================================"
      clone = system("git clone git://gist.github.com/2011415.git")
      exit()
      case clone
      when true
        puts "Cloned!"
        puts "======================================"
        puts 'Notice:"say2.rb" default speaker is "Tom".'
        puts "So can not be used in the state now, "
        puts 'please change it to the default speakers such as "Alex".'
        puts "======================================"
        exit()
      when false
        puts "Not Cloned."
        puts "Sorry, please try again."
        puts "======================================"
        exit()
      end
    end
  when "n"
    puts "======================================"
    puts "You selected [n], not cloned."
    puts "======================================"
    exit()
  else
    puts "======================================"
    puts "Unknown command."
    puts "Sorry, please try again."
    puts "======================================"
    sleep 2
  end
end

