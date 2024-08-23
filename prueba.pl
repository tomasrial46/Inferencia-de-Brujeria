% Hechos que definen las características de las brujas y sus posibles valores
caracteristica(genero, [0, 0.1]). % Hombre  Mujer
caracteristica(tonalidad_pelo, [0, 0.01, 0.03, 0.04]). % Morena Rubia Pelirroja Calva
caracteristica(frecuencia_eclesiastica, [0, 0.02, 0.06]). % Diariamente Esporádicamente Nunca
caracteristica(longitud_uñas, [0, 0.01, 0.03, 0.04]). % Muy cortas Cortas Largas Muy largas
caracteristica(peso_comparado_ganso, [0, 0.06]). % No pesa igual  Pesa lo mismo (6.5kg)
caracteristica(tamaño_nariz, [0, 0.01, 0.04]). % Pequeña Común Puntiaguda
caracteristica(olor, [0, 0.01, 0.03, 0.04]).% Estiercol  Olor Común  Perfumada Azufre
caracteristica(convivencia_sociabilidad, [0, 0.02, 0.05]). % Familia númerosa  Algún familiar  Soledad pertinente
caracteristica(desacato_autoridad, [0, 0.03, 0.06]).% Disciplinada  Sassy  Rebelde
caracteristica(nivel_nado, [0, 0.01, 0.03]).% Se ahoga  Sobrevive Sabe nadar
caracteristica(nivel_economico_financiero, [0, 0.01, 0.02, 0.05]).% pudiente pobre clase media burgués
caracteristica(tonalidad_ojos, [0, 0.02, 0.03, 0.04]).% Café Azul Verde Heterocromía
caracteristica(conocimiento_cientifico, [0, 0.01, 0.03, 0.06]).% Incompetente  Inculto  Conocimientos básicos Ilustrada
caracteristica(horarios, [0, 0.04]).% Diurno Nocturno
caracteristica(edad, [0, 0.02, 0.03, 0.04]).% Niña Jóven Adulta Anciana
caracteristica(zurda, [0, 0.04, 0.05]).% Diestra Zurda Ambalasdúas
caracteristica(lugar_vivienda, [0, 0.02, 0.05]). % Ciudad Afueras Zona Inhabitada
caracteristica(anomalias_cuerpo, [0, 0.01, 0.03, 0.06]).% Ninguna alguna visibles repleta
caracteristica(saber_montar_caballo, [0, 0.04]).% No Sí
caracteristica(cantidad_de_mascotas, [0, 0.01, 0.02, 0.05]). % Sin mascotas Una mascotas Un par de mascotas Más de dos


% Predicado para obtener el valor de una característica en función de su índice
valor_caracteristica(Caracteristica, Indice, Valor) :-
    caracteristica(Caracteristica, Valores),
    nth0(Indice, Valores, Valor).

es_bruja(Persona) :-
    sumar_caracteristicas(Persona, Suma),
    (Suma >= 0.8 ->
        format('La persona ES una BRUJA MADRE, su porcentaje brujil es de: ~2f%.~n', [Suma*100])
    ; Suma >= 0.64 ->
        format('La persona ES una BRUJA DE AQUELARRE, su porcentaje brujil es de: ~2f%.~n', [Suma*100])
    ; Suma >= 0.50 ->
        format('La persona ES una APRENDIZ DE BRUJA, su porcentaje brujil es de: ~2f%.~n', [Suma*100])
    ;
        format('La persona NO ES BRUJA (de momento), su porcentaje brujil es de: ~2f%.~n', [Suma*100])
    ).

sumar_caracteristicas([], 0).
sumar_caracteristicas([Caracteristica|Resto], Suma) :-
    functor(Caracteristica, Nombre, _),  % Obtener el nombre de la característica
    arg(1, Caracteristica, Indice),      % Obtener el índice
    valor_caracteristica(Nombre, Indice, Valor),
    sumar_caracteristicas(Resto, SumaResto),
    Suma is Valor + SumaResto.



