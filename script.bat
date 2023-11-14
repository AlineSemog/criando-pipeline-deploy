echo "Criando as imagens........"

docker build -t alinesemog/projeto-backend:1.0 backend/.
docker build -t alinesemog/projeto-database:1.0 database/.

echo "realizando o push das imagens....."

docker push alinesemog/projeto-backend:1.0
docker push alinesemog/projeto-database:1.0

echo "Criando servicos no cluster kubernet....."

kubectl apply -f ./services.yml

echo "Criando os deployments......"

kubectl apply -f ./deployment.yml
