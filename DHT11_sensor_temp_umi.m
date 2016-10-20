%o tempo de amostragem do sensor ficou o mesmo usado no codigo do arduino
delete(instrfindall); % esse comando corrige um bug em que o matlab nao conecta com o arduino na porta com
s = serial('COM4'); % estabelece comunicação serial. Para saber qual a porta certa vá no gerenciador de dispositivos do windows, depois portas 'com' e vê qual está serial
time=100; % estabelece um limite de tempo para aferição que também será usado como limite para o eixo x do gráfico.
i=1;
while(i<time) % laço while para fazer repetidas capturas da saída serial do arduino.

fopen(s) % faz a leitura da saída do arduino
fprintf(s, 'COM4') % printa a saída do arduino
out = fscanf(s) % captura na variavel out o texto de saída do arduino

Temp(i)=str2num(out(1:4)); % a saída do arduino foi configurada para plotar oito dígitos seguidos. Esse comando captura os 4 primeiros que representam a temperatura.
 subplot(211);
 stairs(Temp,'g'); % plota o gráfico da temperatura
 axis([0,time,20,50]);
title('Temperatura x tempo');
xlabel('Tempo');
ylabel('Temperatura (ºC)');
grid


Humi(i)=str2num(out(5:9)); % Esse comando pega os últimos quatro digitos da saída do arduino que correspondem a umidade relativa do ar.
 subplot(212);
 stairs(Humi,'m'); % plota o gráfico da umidade.
axis([0,time,25,100]);
title('Umidade x tempo');
xlabel('Tempo');
ylabel('Umidade relativa (%)');
grid

fclose(s)
i=i+1;
drawnow; % esse comando faz o gráfico ser redesenhado a cada nova leitura.
end
delete(s)
clear s

