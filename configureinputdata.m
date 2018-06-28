function inputdata = configureinputdata(file, data)

    inputdata.prevparams = 0;
    inputdata.meanRT = getmeanrt(data);
    inputdata.stimthresh = 10/1000;
    inputdata.pulsewidth = 0.000453; % 400 us

    if (contains(file, '20180515') || contains(file, '20180521')) || contains(file, '20180510')% days that vary on stim amp
        inputdata.stimamps  = (20:100)/1000;
        inputdata.stimfreqs = ones(1,numel(inputdata.stimamps))*200;
        inputdata.trainlength = ones(1,numel(inputdata.stimamps))*0.25;
        inputdata.pDetect_actual = data.psychometric_fit_stim(1) + data.psychometric_fit_stim(2) * erf(data.psychometric_fit_stim(3)*(inputdata.stimamps*1000-data.psychometric_fit_stim(4)));
        inputdata.gtype = 'stim';
        
    elseif contains(file, '20180516') || contains(file, '20180511') % vary on stim frequency
        inputdata.stimfreqs = 50:500;
        inputdata.stimamps  = ones(1,numel(inputdata.stimfreqs))*(40/1000);
        inputdata.trainlength = ones(1, numel(inputdata.stimfreqs))*(0.25);
        inputdata.pDetect_actual = data.psychometric_fit_stim(1) + data.psychometric_fit_stim(2) * erf(data.psychometric_fit_stim(3)*(inputdata.stimfreqs-data.psychometric_fit_stim(4)));
        inputdata.gtype = 'freq';
        
    elseif (contains(file, '20180517') || contains(file, '20180525')) % days that vary on train length
        inputdata.trainlength = (25:300)/1000;
        inputdata.stimamps  = ones(1,numel(inputdata.trainlength))*(60/1000);
        inputdata.stimfreqs = ones(1,numel(inputdata.trainlength))*200;
        inputdata.pDetect_actual = data.psychometric_fit_stim(1) + data.psychometric_fit_stim(2) * erf(data.psychometric_fit_stim(3)*(inputdata.trainlength*1000-data.psychometric_fit_stim(4)));
        inputdata.gtype = 'tlen';
        
    elseif contains(file, '20180528') % varies on stim amp
        inputdata.stimamps  = (20:100)/1000;
        inputdata.stimfreqs = ones(1,numel(inputdata.stimamps))*200;
        inputdata.trainlength = ones(1,numel(inputdata.stimamps))*0.12;
        inputdata.pDetect_actual = data.psychometric_fit_stim(1) + data.psychometric_fit_stim(2) * erf(data.psychometric_fit_stim(3)*(inputdata.stimamps*1000-data.psychometric_fit_stim(4)));
        inputdata.gtype = 'stim';
    end
end
