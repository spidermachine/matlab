function etfqqhedge(etf, qqdata, qqcode, start_date, end_date, interval, n)
    qqd = qqdata(qqdata.code==qqcode, :);
    qqd = qqd(qqd.rec_date >= start_date & qqd.rec_date <= end_date, :);
    qqd.dt = datetime(strcat(datestr(qqd.rec_date, 'yyyy-mm-dd'),' ', datestr(qqd.rec_time, 'hh:MM')), 'InputFormat', 'yyyy-MM-ddHH:mm');
    letf = etf(etf.dttime >= start_date & etf.dttime <= end_date, :);
    letf.dt = datetime(strcat(datestr(letf.dttime, 'yyyy-mm-dd'), ' ', datestr(letf.mtime, 'hh:MM')), 'InputFormat', 'yyyy-MM-ddHH:mm');
    % 初始化开始数据
    delta = qqd.delta(1) * n; %买入delta
    etfhold = -delta * 10000; %买入etf份额
    disp(etfhold);
    cash = 100000;
    start_value = etfhold * letf.close(1) + qqd.price(1) * 10000 + cash; % 总市值
    val = [];
    val(1) = start_value;
    pp(1) = etfhold;
    %etf安装时间对齐
    letf = sortrows(letf,'dt','ascend');
    ms = 0;
    for i = 1: length(letf.close)
        if etfhold < 100
            break;
        end
        dtt = letf.dt(i);
        qqtt = qqd(qqd.dt == dtt, :);
        local_delta = qqtt.delta(1) * n - delta;
        
        if local_delta >= interval
           
           etfhold = etfhold - abs(local_delta) * 10000;
           cash = cash + abs(local_delta) * 10000 * letf.close(i);
           ms = ms + abs(local_delta) * 10000 * letf.close(i) * 0.0001;
           delta = qqtt.delta(1) * n;
           disp(dtt);
           disp('sell')
           disp(abs(local_delta) * 10000);
           disp(letf.close(i));
           disp("-------");
        end
        
        if local_delta <= -interval
            etfhold = etfhold + abs(local_delta) * 10000;
            cash = cash - abs(local_delta) * 10000 * letf.close(i);
            ms = ms + abs(local_delta) * 10000 * letf.close(i) * 0.0001;
            delta = qqtt.delta(1) * n; %total delta
            disp(dtt);
            disp('buy')
            disp(abs(local_delta) * 10000);
            disp(letf.close(i));
            disp("-------");
        end
        
        val(i) = etfhold * letf.close(i) + qqd.price(i) * n * 10000 + cash - ms;
        ms = 0;
        pp(i) = etfhold;
    end
    disp(val(1)-val(length(val)));
    disp(qqd.price(1) - qqd.price(length(qqd.price)));
    hold on;
    plot(1: length(qqd.delta), qqd.delta);
%     plot(1: length(val), pp);
    hold off;
end
