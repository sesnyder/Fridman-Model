function nothing = plotpdetect(inputdata)
    if strcmp(inputdata.gtype, 'stim')
        figure;
        hold on;
        xlabel('Stim amplitude');
        ylabel('P_{detect}');
        plot(inputdata.stimamps, inputdata.pDetect_actual);
        if inputdata.prevparams == 1
            plot(inputdata.stimamps, inputdata.pDetect_pred, 'g--');
        else
            plot(inputdata.stimamps, inputdata.pDetect_pred);
        end
        legend('Real','Predicted');
        hold off;

        figure;
        hold on;
        title('Normalized');
        xlabel('Stim amplitude');
        ylabel('P_{detect}');
        plot(inputdata.stimamps, inputdata.pDetect_actualNorm);
        if inputdata.prevparams == 1
            plot(inputdata.stimamps, inputdata.pDetect_predNorm, 'g--');
        else
            plot(inputdata.stimamps, inputdata.pDetect_predNorm);
        end
        legend('Real','Predicted');
        hold off;

    elseif strcmp(inputdata.gtype, 'freq')
        figure;
        hold on;
        xlabel('Stim Frequency');
        ylabel('P_{detect}');
        plot(inputdata.stimfreqs, inputdata.pDetect_actual);
        if inputdata.prevparams == 1
            plot(inputdata.stimfreqs, inputdata.pDetect_pred, 'g--');
        else
            plot(inputdata.stimfreqs, inputdata.pDetect_pred);
        end
        legend('Real','Predicted');
        hold off;
        
        figure;
        hold on;
        xlabel('Stim Frequency');
        ylabel('P_{detect}');
        plot(inputdata.stimfreqs, inputdata.pDetect_actualNorm);
        if inputdata.prevparams == 1
            plot(inputdata.stimfreqs, inputdata.pDetect_predNorm, 'g--');
        else
            plot(inputdata.stimfreqs, inputdata.pDetect_predNorm);
        end
        legend('Real','Predicted');

    elseif strcmp(inputdata.gtype, 'tlen')
        figure;
        hold on;
        xlabel('Train Lenth (s)');
        ylabel('P_{detect}');
        plot(inputdata.trainlength, inputdata.pDetect_actual);
        if inputdata.prevparams == 1
            plot(inputdata.trainlength, inputdata.pDetect_pred, 'g--');
        else
            plot(inputdata.trainlength, inputdata.pDetect_pred);
        end
        legend('Real','Predicted');
        hold off;

        figure;
        hold on;
        xlabel('Train Length');
        ylabel('P_{detect}');
        plot(inputdata.trainlength, inputdata.pDetect_actualNorm);
        if inputdata.prevparams == 1
            plot(inputdata.trainlength, inputdata.pDetect_predNorm, 'g--');
        else
            plot(inputdata.trainlength, inputdata.pDetect_predNorm);
        end
        legend('Real','Predicted');
        hold off;
    end
end
