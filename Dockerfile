from debian
run apt-get update
run apt-get install -yqq gnuplot wget gawk curl zip unzip
run curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64-2.0.30.zip" -o "awscliv2.zip" ; unzip awscliv2.zip ; ./aws/install
add src /scitace/
run mkdir /s3/
env PATH="/scitace/:${PATH}"
workdir /s3/