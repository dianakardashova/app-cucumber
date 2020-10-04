module ApiStatus


  def set_404_status

    status 404
    File.read(File.join(path, 'public', '404.html'))
  end

end