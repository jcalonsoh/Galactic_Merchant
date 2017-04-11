Decidiste abandonar la Tierra después de que el último colapso
financiero dejó al 99.99% de la población con el 0.01% de la
riqueza. Afortunadamente, con la escasa suma de dinero que quedó en
tu cuenta, puedes rentar una nave espacial, dejar la Tierra, y
viajar alrededor de la Galaxia para vender metales comunes y polvo
(que aparentemente es muy costoso).

Para comprar y vender alrededor de la Galaxia necesitas convertir
números y unidades, así que decidiste escribir un programa que te
ayude.

Los números usados para las transacciones intergalácticas siguen
una convención similar a la de los números romanos y con mucho
esfuerzo has recolectado la traducción apropiada entre
ellos.

Los números romanos están basados en siete símbolos:

|Símbolo|Valor|
|:-----:|:---:|
| I | 1 | 3
| V | 5 |
| X | 10 | 30
| L | 50 |
| C | 100 | 300
| D | 500 |
| M | 1000 | 3000

Los números se forman combinando símbolos y sumando sus valores. Por ejemplo, MMVI es 1000 + 1000 + 5 + 1 = 2006. Generalmente, los símbolos están ordenados por valor, empezando con los de mayor valor. Cuando un  valor menor antecede a uno mayor, el valor menor se resta del mayor, y el resultado se suma al total. Por ejemplo MCMXLIV = 1000 + (1000 − 100) + (50 − 10) + (5 − 1) = 1944.

Los símbolos “I”, “X”, “C” y “M” pueden repetirse hasta tres veces sucesivamente. (Pueden aparecer cuatro veces si el tercero y cuarto están separados por un valor menor, como en XXXIX). “D”, “L” y “V” no se pueden repetir.  

“I” sólo puede restarse de “V” y “X”. “X” sólo puede restarse de “L” y “C”. “C” sólo puede restarse de “D” y “M”. “V”, “L” y “D” nunca pueden restarse.

Sólo un símbolo de menor valor puede restarse de cualquier símbolo de mayor valor.

Un número arábigo puede ser descompuesto en dígitos. Por ejemplo, 1903 está compuesto de 1, 9, 0 y 3. Para escribir el número romano, cada uno de los dígitos excepto el cero debe ser tratado por separado. En el ejemplo anterior, 1000 = M, 900 = CM y 3 = III. Por lo tanto, 1903 = MCMIII. La entrada del programa consiste en líneas de texto detallando tus notas de la conversión entre unidades intergalácticas y números romanos.

Se espera que manejes apropiadamente las consultas inválidas.

Tanto la entrada como la salida del programa deben ser en idioma
inglés.

Entrada de prueba:

glob is I
prok is V
pish is X
tegj is L
glob glob Silver is 34 Credits
glob prok Gold is 57800 Credits
pish pish Iron is 3910 Credits
how much is pish tegj glob glob ?
how many Credits is glob prok Silver ?
how many Credits is glob prok Gold ?
how many Credits is glob prok Iron ?
how much wood could a woodchuck chuck if a woodchuck could chuck
wood ?
 


Salida esperada:

pish tegj glob glob is 42
glob prok Silver is 68 Credits
glob prok Gold is 57800 Credits
glob prok Iron is 782 Credits
I have no idea what you are talking about
