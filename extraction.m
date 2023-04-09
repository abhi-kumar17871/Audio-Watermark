filename = 'reconstructed.wav'; 
[y, fs] = audioread(filename);
nfft=2048;
F=fft(y,nfft);
F = F(1:nfft/2);
mx = abs(F);
f = (0:nfft/2-1)*fs/nfft;
t = (0:length(y)-1) / fs;
figure;
subplot(2,1,1);
plot(f,mx);

%subplot(2,1,3);
%plot(f,f);

i=512;
while(i<1024)
if (mx(i)<0.75)
    mx(i)=0;
end
i=i+1;
end

X = zeros(10,1);
i=640;
j=0;
while(i<768)
    if(mx(i)>0.75)
        X(j)=1;
    end
    j=j+1;
    i=i+13;
end
subplot(2,1,2);
plot(f,mx);