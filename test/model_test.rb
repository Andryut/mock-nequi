Dir[File.join(__dir__, '../connection', '*.rb')].each { |file| load file }
models = Dir[File.join(__dir__, '../model', '*.rb')]
models.each do |file|
    begin
        load file 
    rescue
        models.push(file)
    end
end

puts DB 