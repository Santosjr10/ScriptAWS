#!/bin/bash

logs="/var/log/user_data.log"
echo "Executando o Script" > $logs

echo "atualizando pacote" | tee -a $logs
sudo apt update -y >> $logs

echo "instalando o apache" | tee -a $logs

sudo apt install -y apache2  >> $logs
sudo systemctl start apache2 >> $logs
sudo systemctl enable apache2 >> $logs

echo "instalando o git" | tee -a $logs
sudo apt install -y git >> $logs

echo "clonando repositório com site" | tee -a $logs
sudo git clone https://github.com/Santosjr10/ScriptAWS.git /tmp/atividade >> $logs
sudo mv /tmp/atividade/ScriptAWS/index.html /var/www/html/ >> $logs

echo "ajustando permissões" | tee -a $logs
sudo chmod -R 755 /var/www/html/ >> $logs


echo "Reiniciando o apache" | tee -a $logs
sudo systemctl restart apache2 >> $logs 
sudo systemctl status apache2 >> $logs

echo "Enviando uma solicitação post" | tee -a $logs
curl -X POST -d "nome=Alexandre Junior" https://difusaotech.com.br/lab/aws/index.php 

echo "finalizando o Script" | tee -a $logs


