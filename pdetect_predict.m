function outputdata = pdetect_predict(minparams)
    file = '/Users/Sam/Documents/MLL Research/Han RT/Han_20180511_data.mat';
    load(file, 'data');
    outputdata = configureinputdata(file, data);
    outputdata.prevparams = 1;
    
    
    outputdata.pDetect_pred = NaN(numel(outputdata.stimamps),1);
    for i =1:numel(outputdata.stimamps)
        Ps = perceivedintensity(outputdata.stimfreqs(i), outputdata.stimamps(i), outputdata.stimthresh, outputdata.trainlength(i), minparams(5), 0.000453);
        Ps = Ps(end);

        outputdata.pDetect_pred(i) = (minparams(2) + minparams(4)/(1+exp(-(minparams(1)*(Ps-minparams(3))))));
    end
    
    outputdata.pDetect_predNorm = normalizepdetect(outputdata.pDetect_pred);
    outputdata.pDetect_actualNorm = normalizepdetect(outputdata.pDetect_actual);
end