%% Predict detection probability based on stim paramaters
% DESCRIPTIVE TEXT
file = '/Users/Sam/Documents/MLL Research/Han RT/Han_20180510_data.mat';
load(file, 'data');
inputdata = configureinputdata(file, data);

fun = @(x)costfunction(x, inputdata);
disp('Finding params....');
tic
options = optimset('MaxFunEvals', 10000, 'MaxIter', 2000); % 'Display', 'TolFun',1e-8,'Tolx',1e-8);
[minparams, fval, exitflag, output] = fminsearch(fun,[1.35, 0.107, 3.85, .76, 0.48], options)
toc

inputdata.pDetect_pred = NaN(numel(inputdata.stimamps),1);
for i =1:numel(inputdata.stimamps)
    Ps = perceivedintensity(inputdata.stimfreqs(i), inputdata.stimamps(i), inputdata.stimthresh, inputdata.trainlength(i), minparams(5), inputdata.pulsewidth);
    Ps = Ps(end);
    
    inputdata.pDetect_pred(i) = (minparams(2) + minparams(4)/(1+exp(-(minparams(1)*(Ps-minparams(3))))));
end


inputdata.pDetect_predNorm = normalizepdetect(inputdata.pDetect_pred);
inputdata.pDetect_actualNorm = normalizepdetect(inputdata.pDetect_actual);


plotpdetect(inputdata)


outputdata = pdetect_predict(minparams);
plotpdetect(outputdata)



%% Compares perceived intensity and reaction time


filestim = '/Users/Sam/Documents/MLL Research/Han RT/Han_20180528_data.mat';
filefreq = '/Users/Sam/Documents/MLL Research/Han RT/Han_20180511_data.mat';

load(filestim, 'data');
inputdata = configureinputdata(filestim, data);
stimrt = inputdata.meanRT;

Psamp = NaN(9,1);
for i = 1:8
    Pstemp = perceivedintensity(inputdata.stimfreqs(i), (i+1)/100, inputdata.stimthresh, .125, .5, inputdata.pulsewidth);
    Psamp(i) = Pstemp(end); 
end

load(filefreq, 'data');
inputdata = configureinputdata(filefreq, data);
freqrt = inputdata.meanRT;

Psfreq = NaN(8,1);
for i = 1:8
    Pstemp = perceivedintensity(i*50, inputdata.stimamps(i), inputdata.stimthresh, .125, .5, inputdata.pulsewidth);
    Psfreq(i) = Pstemp(end); 
end

figure;
hold on;
xlabel('Perceived Intensity');
ylabel('Mean Reaction Time');
plot(Psamp, stimrt);
plot(Psfreq, freqrt);
legend('Amplitude','Frequency');
hold off;




