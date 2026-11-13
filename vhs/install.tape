# Installs and scales the chart on a local cluster.
# Requires: a running cluster, the image built into it and kubectl apply -f k8s/postgres.yaml
Output vhs/install.gif

Set Shell bash
Set FontSize 16
Set Width 1100
Set Height 620
Set Padding 20
Set Theme "Catppuccin Mocha"
Set TypingSpeed 35ms

Hide
Type "export PS1='$ ' && cd target/helm/kubernetes && clear"
Enter
Show

Type "helm install orders orders-api | head -6"
Enter
Sleep 3s

Type "kubectl rollout status deployment/orders-api"
Enter
Wait+Screen@120s /successfully rolled out/
Sleep 1s

Type "kubectl get pods"
Enter
Sleep 4s

Type "clear"
Enter

Type "helm upgrade orders orders-api --reuse-values --set app.replicas=3 | head -1"
Enter
Sleep 2s

Type "kubectl rollout status deployment/orders-api"
Enter
Wait+Screen@120s /successfully rolled out/
Sleep 1s

Type "kubectl get pods"
Enter
Sleep 6s
