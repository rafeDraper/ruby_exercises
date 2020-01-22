def caesar_cipher(string, number)
  r_string = ''
  string.split('').each do |e|
    character_code = e.ord
    r_string << if character_code.between?(65, 90)
                  (65 + (((character_code - 65) + number) % 26)).chr
                elsif character_code.between?(97, 122)
                  (97 + (((character_code - 97) + number) % 26)).chr
                else
                  e
                end
  end
  r_string
end

