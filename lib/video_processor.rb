require 'streamio-ffmpeg'
module VideoProcessor
        def convert_to_mp4 path_to_input_file
                movie = FFMPEG::Movie.new(path_to_input_file)
                options = "-vcodec copy -acodec copy"
                movie.transcode("/home/ethan/src/video_app/public/videos/output.mp4", options)
        end
        def rip_to_webvtt path_to_input_file
                movie = FFMPEG::Movie.new(path_to_input_file)
                options = "-vn -an"
                movie.transcode("/home/ethan/src/video_app/public/videos/sub.vtt", options, validate: false)
        end

               
end 
