pem=$(cat pem.txt)

index=0
for ip in $(cat ip.txt)
do 
  echo ${index} ${ip}
  ssh -o StrictHostKeyChecking=no -i ${pem} ubuntu@${ip} "curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash - && sudo apt-get install -y nodejs gcc g++ make wondershaper && sudo npm install -g -y pm2"
  ((index++))
done

index=0
for ip in $(cat ip.txt)
do 
  echo ${index} ${ip}
  scp -o StrictHostKeyChecking=no -i ${pem} ./keys.tar.gz ubuntu@${ip}:~/
  ssh -o StrictHostKeyChecking=no -i ${pem} ubuntu@${ip} "mkdir -p data/keystore && tar -C ~/data/keystore -xzf ~/keys.tar.gz"
  ((index++))
done
