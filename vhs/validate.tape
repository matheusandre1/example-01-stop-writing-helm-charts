# Validates the generated chart without a cluster.
# Requires: ./mvnw clean package
Output vhs/validate.gif

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

Type "helm lint orders-api"
Enter
Sleep 3s

Type "helm template orders orders-api --set app.replicas=4 --set app.memoryLimit=1Gi --set app.host=orders.mycompany.com | grep -E 'replicas:|memory:|host:'"
Enter
Sleep 4s

Type "helm template orders orders-api --set app.replicas=1"
Enter
Sleep 6s
