Dir[File.join(__dir__, '../connection', '*.rb')].each { |file| load file }

model_files = Dir[File.join(__dir__, '../model', '*.rb')]
model_files.each do |file|
    begin
        load file 
    rescue
        model_files.push(file)
    end
end

puts User.create(name:'name', email: 'email4', password: '123456').values
puts GeneralAccount.first.owner.values