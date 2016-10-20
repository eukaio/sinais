%o tempo de amostragem do sensor ficou o mesmo usado no codigo do arduino
delete(instrfindall); % esse comando corrige um bug em que o matlab nao conecta com o arduino na porta com
s = serial('COM4'); % estabelece comunica��o serial. Para saber qual a porta certa v� no gerenciador de dispositivos do windows, depois portas 'com' e v� qual est� serial
time=100; % estabelece um limite de tempo para aferi��o que tamb�m ser� usado como limite para o eixo x do gr�fico.
i=1;
while(i<time) % la�o while para fazer repetidas capturas da sa�da serial do arduino.

fopen(s) % faz a leitura da sa�da do arduino
fprintf(s, 'COM4') % printa a sa�da do arduino
out = fscanf(s) % captura na variavel out o texto de sa�da do arduino

Temp(i)=str2num(out(1:4)); % a sa�da do arduino foi configurada para plotar oito d�gitos seguidos. Esse comando captura os 4 primeiros que representam a temperatura.
 subplot(211);
 stairs(Temp,'g'); % plota o gr�fico da temperatura
 axis([0,time,20,50]);
title('Temperatura x tempo');
xlabel('Tempo');
ylabel('Temperatura (�C)');
grid


Humi(i)=str2num(out(5:9)); % Esse comando pega os �ltimos quatro digitos da sa�da do arduino que correspondem a umidade relativa do ar.
 subplot(212);
 stairs(Humi,'m'); % plota o gr�fico da umidade.
axis([0,time,25,100]);
title('Umidade x tempo');
xlabel('Tempo');
ylabel('Umidade relativa (%)');
grid

fclose(s)
i=i+1;
drawnow; % esse comando faz o gr�fico ser redesenhado a cada nova leitura.
end
delete(s)
clear s

