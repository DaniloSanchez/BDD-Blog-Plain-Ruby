class  Blog

  def initialize
  end

  def run_file
    file_topics_name = File.open("Posts/topics.csv")
    handle = []
    all_posts = read_file(file_topics_name,handle)
    print_file(all_posts)
    find_body_topic(all_posts)
  end

  def read_file(file,handle)
    while not file.eof?
      handle << file.readline
    end
    file.close
    handle
  end

  def find_body_topic(file_topics_name)
    file_topics_name.each do |row|
      parts_of_line = row.split(',')
      loading_body(parts_of_line[0],parts_of_line[1])
    end
  end

  def loading_body(index, topic_name)
    fullname = 'bodyPosts/' <<  index << ' ' << topic_name << '.txt'
    file = File.open(fullname)
    handle = []
    body_post = read_file(file,handle)
    print_file(body_post)
  end

  def print_file(file)
    file.each{|e| puts e}
  end

end
