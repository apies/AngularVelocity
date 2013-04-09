
RSpec::Matchers.define :be_a_file_containing_text do |expected_file_text|




  match do |file_path|
    if is_a_file(file_path)
      File.readlines(file_path).any? {|line| line.include?(expected_file_text)}
    else
      false
    end
  end

  failure_message_for_should do |file_path|
    generate_failure_message
  end

  description do
     "expected that the file #{file_path}
        would contain text #{expected_file_text}"
  end


  def is_a_file(file_path)
    @nil_file = true unless file_path
    @file_not_found = true unless File.file?(file_path)
    file_path && File.file?(file_path)
  end

  def generate_failure_message
    if @file_not_found
      "the file at path #{file_path} does not exist"
    elsif @nil_file
      "something strange going on here, you didnt pass a file_path"
    else
      "expected that the file #{file_path}
        would contain text #{expected_file_text}"
    end
  end



end

