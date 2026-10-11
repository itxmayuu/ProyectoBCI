% EXPLORACIÓN DE DATOS - MIND BIG DATA (SEÑALES CEREBRALES)
% Justificación para el uso de Redes Neuronales Multicapa (MLP)

clear; clc; close all;

% 1. Cargar el subconjunto de datos optimizado
disp('Cargando datos cerebrales...');
% Cambia la ruta si es necesario
ruta_archivo = 'Escribir la ruta de la base';
load(ruta_archivo);

% X contiene características extraídas de las señales EEG
% Y contiene las etiquetas (los números del 0 al 9 que la persona estaba viendo)
Y = double(Y);

% Filtrar valores atípicos extremos (ruido del sensor) para que las gráficas se vean bien
% (Los EEG a veces tienen saltos masivos cuando la persona parpadea)
X = filloutliers(X, 'clip', 'median');

% Mapa de colores para los 10 dígitos (0-9)
colores = hsv(10); 

%% GRÁFICA 1: Dispersión 3D de Actividad Cerebral (Top 3 Características)
figure('Name', 'Dispersión 3D - Señales Cerebrales', 'NumberTitle', 'off', 'Color', 'w');
scatter3(X(:,1), X(:,2), X(:,3), 15, Y, 'filled');
colormap(colores);
cb = colorbar;
cb.Title.String = 'Dígito Pensado (0-9)';
title('Espacio de Características (Señales EEG)');
xlabel('Sensor 1 (Voltage)');
ylabel('Sensor 2 (Voltage)');
zlabel('Sensor 3 (Voltage)');
grid on;


%% GRÁFICA 2: Matriz de Correlación (Heatmap de Ondas)
figure('Name', 'Correlación entre Canales EEG', 'NumberTitle', 'off', 'Color', 'w');
matriz_corr = corr(X);
imagesc(matriz_corr);
colorbar;
colormap('parula');
title('Matriz de Correlación entre Canales y Tiempos del EEG');
xlabel('Muestra de Tiempo / Canal');
ylabel('Muestra de Tiempo / Canal');


%% GRÁFICA 3: Boxplot (Identificación de Ruido/Parpadeos)
figure('Name', 'Varianza de Señales Cerebrales', 'NumberTitle', 'off', 'Color', 'w');
X_norm = zscore(X); 
boxplot(X_norm(:, 1:15)); % Mostramos 15 muestras para legibilidad
title('Diagrama de Caja - Ruido y Varianza en EEG');
xlabel('Muestra Temporal (Feature)');
ylabel('Voltaje Normalizado (Z-score)');
grid on;


%% GRÁFICA 4: Histogramas (Voltaje Cerebral)
figure('Name', 'Distribución de Señales EEG', 'NumberTitle', 'off', 'Color', 'w');
for i = 1:4
    subplot(2, 2, i);
    histogram(X(:, i), 60, 'FaceColor', [0.8 0.2 0.3]);
    title(['Distribución de Voltaje - Sensor ', num2str(i)]);
    xlabel('Microvoltios (\muV)');
    grid on;
end
sgtitle('Comportamiento probabilístico de las señales cerebrales');
