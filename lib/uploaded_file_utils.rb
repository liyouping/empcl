# encoding UTF-8
class UploadedFileUtils
  require "uuidtools"

  def self.save_uploaded_file(tmp_file)
    return if tmp_file.blank?
    file_name = UUIDTools::UUID.random_create.to_s+File.extname(tmp_file.original_filename).downcase
    save_path = "/public/upload/"
    file_path = "#{Rails.root}"+save_path
    unless File.exist?(file_path)
      begin
        FileUtils.mkdir_p(file_path, :mode => 0777)
      rescue Errno::EACCES
        FileUtils.chmod_R 0777, "#{Rails.root}/public/upload/"
        FileUtils.mkdir_p(file_path, :mode => 0777)
      end
    end
    File.open(file_path + file_name, "wb" ) do |f|
      f.write(tmp_file.read)
    end
    "/upload/" + file_name
  end
end