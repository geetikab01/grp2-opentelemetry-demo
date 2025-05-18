aws eks --region us-east-1 update-kubeconfig --name otel-demo-cluster
sudo kubectl get nodes
git clone https://github.com/danitrical/opentelemetry-demo-enpm818N-final-project.git
cd opentelemetry-demo-enpm818N-final-project/kubernetes
sudo kubectl apply -f opentelemetry-demo.yaml -n otel-demo
sudo kubectl get all -n otel-demo
sudo kubectl logs <pod-name> -n otel-demo