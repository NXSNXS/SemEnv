#find ~/.m2 -name \*.jar | while read name
#do
#    jar tf $name >/dev/null || echo $name
#done

find  ~/.m2/repository/ -name "*jar" | xargs -L 1 zip -T | grep error | grep invalid  
