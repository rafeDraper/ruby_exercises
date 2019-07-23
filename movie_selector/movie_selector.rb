movies = {
    Interestellar: 5,
    Madmax_fury_road: 5,
    Inglorious_bastards: 5
    }
  
  puts "Lets create our library, please enter the next options:"
  puts "add -> to add a new movie/rating"
  puts "update -> to update already existing movies/ratings"
  puts "display -> displays movies/ratings"
  puts "delete -> removes movies/ratings"
  choice = gets.chomp
  
  case choice
    when "add"
    puts "Whats the movie title?"
    title = gets.chomp.capitalize!
    puts "from 0 to 5 which rating you give?"
    rating = gets.chomp
    if movies[title.to_sym] == nil 
        movies[title.to_sym] = rating.to_i
      puts "The movie: #{title} was added with a rating of: #{rating}"
    else
      puts "That movie is already there buddy"
    end 
    
    when "update"
    puts "Please enter the title of the movie you want to update:"
    title = gets.chomp.capitalize!
    if movies[title.to_sym] == nil
      puts "That movie doesnt even exists yet huh?"
    else
      puts "Ok now, whats the rating you want to give now?"
      rating = gets.chomp
      movies[title.to_sym] = rating.to_i
      puts "The movie: #{title} was updated with a rating of: #{rating}"
    end
    
    when "display"
    movies.each {|movie, rating| puts "#{movie}: #{rating}"}
    
    when "delete"
    puts "Please enter the title you want to remove"
    title = gets.chomp.capitalize!
    if movies[title.to_sym] == nil
      puts "I cant delete something that doesnt exists"
    else
      movies.delete(title)
    end
    
  else 
    puts "Error!"
  end