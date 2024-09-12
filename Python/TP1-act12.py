#Actividad 12-A
# (λx.x + 2) 3
resultado = (lambda x: x+2)(3)
print(resultado)#el resultado es 5

#Actividad 12-B
#(λx. − x) 7
resultado2 = (lambda x: -x)(7)
print(resultado2)#el resultado es -7

#Actividad 12-C
#(λx.λy.x ∗ y) 5 2
resultado3 = (lambda x : lambda y: x * y)(5)(2) 
print(resultado3)#el resultado es 10

#Actividad 12-D
#(λx.xx)(λx.xx)
resultado4 = (lambda x: x * x)
relsult = resultado4(resultado4)
print(resultado4)