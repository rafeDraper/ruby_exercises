# frozen_string_literal: true

require 'csv'
require 'google/apis/civicinfo_v2'
require 'erb'

def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5, '0')[0..4]
end

def legislators_by_zipcode(zip)
  civic_info = Google::Apis::CivicinfoV2::CivicInfoService.new
  civic_info.key = 'AIzaSyClRzDqDh5MsXwnCWi0kOiiBivP6JsSyBw'
  begin
    legislators = civic_info.representative_info_by_address(
      address: zip,
      levels: 'country',
      roles: %w[legislatorUpperBody legislatorLowerBody]
    )
    legislators = legislators.officials
    legislator_names = legislators.map(&:name)
    legislator_names.join(', ')
  rescue StandardError
    'You can find your representatives by visiting www.commoncause.org/take-action/find-elected-officials'
  end
end

def save_thank_you_letters(id, form_letter)
  Dir.mkdir('output') unless Dir.exist? 'output'

  filename = "output/thanks_#{id}.hmtl"

  File.open(filename, 'w') do |file|
    file.puts form_letter
  end
end

def correct_numbers(phone_numbers)
  # if it has more than 11
  if phone_numbers.length >= 10
    phone_numbers.gsub(/\D/, '').insert(3, '-')
  else
    'invalid number'
  end
end

puts 'Event Manager Initialized'

content = CSV.open './event_attendees.csv', headers: true, header_converters: :symbol
template_letter = File.read 'form_letter.erb'
erb_template = ERB.new(template_letter)

content.each do |row|
  id = row[0]
  name = row[:first_name]

  zipcode = clean_zipcode(row[:zipcode])

  legislators = legislators_by_zipcode(zipcode)

  form_letter = erb_template.result(binding)

  save_thank_you_letters(id, form_letter)

  puts phone_numbers = correct_numbers(row[:homephone])
end
