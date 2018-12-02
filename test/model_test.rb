Dir[File.join(__dir__, '../connection', '*.rb')].each { |file| load file }

model_files = Dir[File.join(__dir__, '../model', '*.rb')]
model_files.each do |file|
    begin
        load file 
    rescue
        models.push(file)
    end
end

puts DB 