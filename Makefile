init:
	echo "  >  Init..."
	python3 -m venv .venv
	source .venv/bin/activate && pip install --upgrade pip && pip install -r requirements.txt && deactivate

format:
	echo "  >  Formating..."
	source .venv/bin/activate && python -m black *.py && deactivate

render:
	echo "  >  Rendering..."
	source .venv/bin/activate && python render.py && deactivate
	#fmpeg -f lavfi -i "sine=frequency=1000:duration=5" -ac 5 output.wav
	ffmpeg -y -loglevel error -s 3840x2160 -pix_fmt yuv444p10le -framerate 25 -stream_loop -1 -i yuv444p10le_std-b72_3840x2160.yuv -t 1 -c:v libx264 -s 3840x2160 -r 25 -pix_fmt yuv422p10le -me_method tesa -subq 9 -x264-params partitions=all -direct-pred auto -psy 0 -b:v 251M -bufsize 254M -level 5.1 -g 0 -x264-params keyint=1 -x264-params filler -x264-params nal-hdr=cbr -x264-params coder=vlc -preset slow -tune fastdecode -color_primaries bt2020 -color_trc arib-std-b67 -colorspace bt2020nc out-bt2020-10bit-hlg.mp4
	ffmpeg -y -loglevel error -s 3840x2160 -pix_fmt yuv444p10le -framerate 25 -stream_loop -1 -i yuv444p10le_bt2020_3840x2160.yuv -t 1 -c:v libx264 -s 3840x2160 -r 25 -pix_fmt yuv422p10le -me_method tesa -subq 9 -x264-params partitions=all -direct-pred auto -psy 0 -b:v 251M -bufsize 254M -level 5.1 -g 0 -x264-params keyint=1 -x264-params filler -x264-params nal-hdr=cbr -x264-params coder=vlc -preset slow -tune fastdecode -color_primaries bt2020 -color_trc smpte2084 -colorspace bt2020nc out-bt2020-10bit-pq.mp4
	ffmpeg -y -loglevel error -s 3840x2160 -pix_fmt yuv444p -framerate 25 -stream_loop -1 -i yuv444p_bt709_3840x2160.yuv -t 1 -c:v libx264 -s 3840x2160 -r 25 -pix_fmt yuv422p -me_method tesa -subq 9 -x264-params partitions=all -direct-pred auto -psy 0 -b:v 251M -bufsize 254M -level 5.1 -g 0 -x264-params keyint=1 -x264-params filler -x264-params nal-hdr=cbr -x264-params coder=vlc -preset slow -tune fastdecode -color_primaries bt709 -color_trc bt709 -colorspace bt709 out-bt709-8bit.mp4
	ffmpeg -y -loglevel error -s 3840x2160 -pix_fmt yuv444p10le -framerate 25 -stream_loop -1 -i yuv444p10le_bt709_3840x2160.yuv -t 1 -c:v libx264 -s 3840x2160 -r 25 -pix_fmt yuv422p10le -me_method tesa -subq 9 -x264-params partitions=all -direct-pred auto -psy 0 -b:v 251M -bufsize 254M -level 5.1 -g 0 -x264-params keyint=1 -x264-params filler -x264-params nal-hdr=cbr -x264-params coder=vlc -preset slow -tune fastdecode -color_primaries bt709 -color_trc bt709 -colorspace bt709 out-bt709-10bit.mp4
	ffmpeg -y -loglevel error -s 3840x2160 -pix_fmt yuv444p10le -framerate 25 -stream_loop -1 -i yuv444p10le_bt709_3840x2160.yuv -t 1 -c:v libx264 -s 3840x2160 -r 25 -pix_fmt yuv422p10le -me_method tesa -subq 9 -x264-params partitions=all -direct-pred auto -psy 0 -b:v 251M -bufsize 254M -level 5.1 -g 0 -x264-params keyint=1 -x264-params filler -x264-params nal-hdr=cbr -x264-params coder=vlc -preset slow -tune fastdecode -color_primaries bt709 -color_trc smpte2084 -colorspace bt709 out-bt709-10bit-pq.mp4
	ffmpeg -y -loglevel error -s 3840x2160 -pix_fmt yuv444p10le -framerate 25 -stream_loop -1 -i yuv444p10le_bt2020_3840x2160.yuv -t 1 -c:v libx264 -s 3840x2160 -r 25 -pix_fmt yuv422p10le -me_method tesa -subq 9 -x264-params partitions=all -direct-pred auto -psy 0 -b:v 251M -bufsize 254M -level 5.1 -g 0 -x264-params keyint=1 -x264-params filler -x264-params nal-hdr=cbr -x264-params coder=vlc -preset slow -tune fastdecode -color_primaries bt2020 -color_trc bt2020-10 -colorspace bt2020nc out-bt2020-10bit.mp4