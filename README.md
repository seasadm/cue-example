ex1
cue import deployment.yaml
cue export ./*.cue --out yaml

ex2

ubuntu@jumphost:~/highload/ex02-02-values-extract$ cue export ./*.cue --out yaml
spec.template.spec.containers.image: reference "_values" not found:
    ./deployment.cue:14:11
spec.template.spec.containers.env.value: reference "_values" not found:
    ./deployment.cue:17:12

ex3
cue import deployment.yaml -l 'strings.ToCamel(kind)' -l metadata.name -f

cue export --expression all --out yaml
