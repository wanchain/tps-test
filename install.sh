pem=~/nodes/tps.pem

index=0
for ip in $(cat ip.txt)
do 
  echo ${index} ${ip}
  ssh -o StrictHostKeyChecking=no -i ${pem} ubuntu@${ip} "curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash - && sudo apt-get install -y nodejs gcc g++ make && sudo npm install -g -y pm2"
  ((index++))
done
