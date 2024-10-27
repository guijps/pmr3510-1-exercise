% base de imoveis disponíveis para aluguel
% cada imovel é caracterizado pelo tipo (apt, kitnet, quarto), onde um apt pode ter mais
% de um quarto. Os kitnets e quartos recebem o valor 1 nesse item. Além do tipo cada 
% imovel deve ter especificado o nome do locador, endereço (string), o portão mais próximo,
% e uma medida da distância à pé do imóvel até a USP (em metros). 

% IMOVEL(TIPO, QUARTOS, ALUGUEL, ENDEREÇO, PORTÃO_PRÓXIMO, DISTANCIA, CPF, CEP)
imovel(apt, 3, 2700, "Rua José Alves Cunha Lima, 159", "portão 3", 310, "546.299.360-92", "05360-050").
imovel(kitnet, 1, 1200, "Rua Abadia dos Dourados, 325","portão V.Indiana", 600, "791.849.608-68", "05586-030").
imovel(kitnet, 1, 950, "Rua Aconaris, 49", "portão V.Indiana", 550, "378.672.528-43", "05586-040").
imovel(kitnet, 1, 1450, "Rua Iquiririm, 911", "portão V.Indiana", 200, "242.354.848-69", "05586-001").
imovel(kitnet, 1, 1500, "Rua Boturoca, 288","portão V.Indiana",200, "406.303.068-77", "05586-010").
imovel(kitnet, 1, 1250, "Rua Cacilda castanho de Andrade, 118","portão 3",1220, "803.044.728-08", "05359-020").
imovel(kitnet, 1, 1200, "Rua Padre Luís Yeber, 84","portão 3", 800, "949.914.918-00", "05362-020").
imovel(kitnet, 1, 1160, "Rua Amorim Castro","portão 3",800, "916.138.308-23", "05362-050").
imovel(kitnet, 1, 1600, "Rua Frei Inácio da Conceição","portão 3",750, "014.528.418-29", "05362-040").
imovel(apt, 1, 2750, "Rua M.M.D.C, 80","portão 1",1300, "849.131.858-53", "05510-021").
imovel(apt, 3, 3500, "Rua Alexandre Calame, 80","portão 2", 1000, "223.856.248-69", "05347-030").
imovel(apt, 2, 3734, "Rua Engenheiro Bianor, 137","portão 1", 980, "832.531.948-84", "05502-010").
imovel(quarto, 1, 2600, "Rua José Piragibe, 11","portão V.Indiana",600, "407.099.818-72", "05585-040").
imovel(quarto, 1, 1777, "Rua José Piragibe, 366","portão V.Indiana",600, "170.325.748-07", "05585-040").
imovel(apt, 4, 2800, "Rua Jerônimo França, 117","portão V.Indiana",800, "649.276.088-32", "05585-070").
imovel(apt, 2, 2255, "Rua Padre Caresia, 91","portão 2",2100, "263.913.438-88", "05334-040").
imovel(apt, 2, 5500, "Avenida Presidente Altino, 386","portão 2",2600, "401.160.348-15", "05323-000").
imovel(apt, 3, 4400, "Rua Jaguaré","portão 2",2000, "884.444.428-36", "05344-030").
imovel(apt, 3, 3350, "Avenida Nossa Senhora da Assunção, 647","portão 3",950, "530.343.008-16", "05359-001").
imovel(apt, 2, 4025, "Rua Raul Saddi, 88","portão 1",600, "171.675.318-04", "05503-010").


% predicado que descreve o local encontrado  
print_imovel(A,B,C,D,E,F) :- imovel(A,B,C,D,E,F,_,_), write(A), nl,
    write("Possui "), write(B), write(" quarto(s)"), nl,
    write("Pelo custo mensal de "),write(C), write(" reais"),nl,
    write("Endereço: "), write(D), nl,
    write("Próximo ao portão "), write(E),nl,
    write("a uma distancia à pé de "), write(F), write(" metros"), nl.

% predicado de busca principal

imovel_search :- write('Qual tipo de imovel que você procura? (apt, kitnet, quarto) '),
                     nl, read(Tipo), nl,
                write('indique o preço máximo do aluguel'), nl, read(Max), nl,
                imovel(Tipo, Quartos, Aluguel, End, Portao, Distancia,_,_), Aluguel < Max,
                 print_imovel(Tipo, Quartos, Aluguel, End, Portao, Distancia), 
                 indica_perigo(Portao).

    
% insira aqui as heurísticas para tornar o programa mais inteligente

% abaixo temos um exemplo de predicado para acrescentar indicações no programa

indica_perigo("portão 1") :- write("movimentado").
indica_perigo("portão 2") :- write("perigoso a noite").
indica_perigo("portão 3") :- write("perigoso a noite").
indica_perigo("portão V.Indiana") :- write("perigoso a noite").