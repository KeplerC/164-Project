filt_strike = zeros(1,1);
filt_time = zeros(1,1);
filt_sig = zeros(1,1);
num=1;
for i = 1:20211
    if (final_sigma(i,1)>-0.01 && final_sigma(i,1)<100)
        filt_strike(num,1)=Strike_Price(i,1);
        filt_sig(num,1)=final_sigma(i,1);
        filt_time(num,1)=Option_Length(i,1)*360;
        num = num+1;
    end
end
filt_filt_strike = zeros(81,1);
filt_filt_time = zeros(276,1);
filt_filt_sig = zeros(81,276,1);
% filter = zeros(201,1);
% for i=100:300
%     count=0;
%     for j=1:(num-1)
%         if (filt_strike(j,1)>=i && filt_strike(j,1)<(i+1))
%             count = count+1;
%             filter(i-99,1) = filter(i-99,1)+filt_sig(j,1);
%         end
%     end
%     filter(i-99,1)=filter(i-99,1)/count;
% end
for i = 120:200
    for k = 30:305
        count = 0;
        for j = 1:20211
            if (filt_strike(j,1)>=i && filt_strike(j,1)<(i+1) && filt_time(j,1)>=k && filt_time(j,1)<(k+1))
                count = count + 1;
                filt_filt_strike(i-119,1)=filt_filt_strike(i-119,1)+1;
                filt_filt_time(k-29,1)=filt_filt_time(k-29,1)+1;
                filt_filt_sig(i-119,k-29,1)=filt_filt_sig(i-119,k-29,1)+filt_sig(j,1);
            end
        end
        filt_filt_sig(i-119,k-29,1)=filt_filt_sig(i-119,k-29,1)/count;
    end
end
    