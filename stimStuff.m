

load('/Users/Sam/Documents/MLL Research/Han_20180515_data.mat');
inputdata.stimamps = (20:100)/1000;
inputdata.stimfreq =200;
inputdata.stimthresh = 10/1000;
inputdata.time = 0.25;
inputdata.Pdetect = data.psychometric_fit_stim(1) + data.psychometric_fit_stim(2) * erf(data.psychometric_fit_stim(3)*(inputdata.stimamps*1000-data.psychometric_fit_stim(4)));

fun = @(x)costFunction(x, inputdata);
options = optimset('MaxFunEvals', 1000, 'MaxIter', 1000,'Display','Iter','TolFun',1e-8,'Tolx',1e-8);
minparams = fminsearch(fun,[1.35, 0.107, 3.85, .76, 0.48], options);

Pdetect_pred = NaN(numel(inputdata.stimamps),1);
Ps_all = [];
for i =1:numel(inputdata.stimamps)
    Ps = perceivedIntensity(inputdata.stimfreq, inputdata.stimamps(i), inputdata.stimthresh, inputdata.time, minparams(5));
    Ps = Ps(end);
    
    Pdetect_pred(i) = (minparams(2) + minparams(4)/(1+exp(-(minparams(1)*(Ps-minparams(3))))));
end


