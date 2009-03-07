created_dir = 'tmp'
start_dir = Dir.getwd
puts start_dir
Dir.mkdir created_dir
Dir.chdir created_dir
puts Dir.getwd
Dir.chdir start_dir
Dir.delete created_dir

