require 'streamio-ffmpeg'
module VideoProcessor
        def convert_to_horrible path_to_input_file
            movie = FFMPEG::Movie.new(path_to_input_file)
            options = "-vcodec copy -acodec copy"
            movie.transcode("/home/ethan/src/video_app/public/videos/tmp/output.mp4", options)
        end
        def convert_to_coalgirls path_to_input_file
             movie = FFMPEG::Movie.new(path_to_input_file)
            options = "-vcodec copy -strict experimental -acodec aac"
            movie.transcode("/home/ethan/src/video_app/public/videos/tmp/output.mp4", options)
        end
        def rip_to_webvtt path_to_input_file
            movie = FFMPEG::Movie.new(path_to_input_file)
            options = "-vn -an"
            movie.transcode("/home/ethan/src/video_app/public/videos/tmp/sub.vtt", options, validate: false)
        end

               
end 
