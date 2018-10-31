clc

open = xlsread('D:\Subvocal\hello.xls');
voltage_array_test = open(8,:);

files = dir('D:\Subvocal\*.xls');

for l = 1:length(files)

     fileopen = files(l).name;
     excel_file = xlsread(strcat('D:\Subvocal\', fileopen));
     
     fileopen= fileopen(1:end-4);
     matrix(l).fileopen = excel_file;
     
end

result = 'Match Not Found';
flag = 0;

for u = 1:length(files)
                fileopen = files(u).name;
                fileopen = fileopen(1:end-4);
                
                noRows = size(matrix(u).fileopen, 1);
                
                for v = [9]
                    
                                   
                    [Dist(v),D,k,w] = dtw(matrix(u).fileopen(v,:), voltage_array_test);
                    plot(w)
                
                end 
                
                minimum(u) = min(Dist);
                min(minimum(u));
                      
end

if min(minimum) < 0.3
                pos = find(minimum == min(minimum));
                result = files(pos).name;
                result = result(1:end-4)
end

tts(result);



%%
open1=xlsread('D:\Subvocal\hello.xls');
example = open1(9,:);

subplot(211);

plot(voltage_array_test);
title('Hello');

subplot(212);

plot(example);
title('Baseball');

%%
[Dist(v),D,k,w] = dtw(example, voltage_array_test);
plot(w(:,1),w(:,2))
title('Hello vs Hello');