clear PPG
clear PPG_c
global ppg;
global ppg_for_bp;
global packet_received;
global sbp_net;
global dbp_net;
global YPred_sbp;
global YPred_dbp;
global sbp;
global dbp;
global bp_calculated;
global hr_array;
global hr_count;
global HR;
global T;
global ecg;
global eT;
global b;
global SAMPLE_WINDOW;
global ppg_text;
global sbp_text;
global dbp_text;
global ecg_text;
global ecg_text1;
global data;
global timestamp;
global num_data_available;
global ppg_data_count;
global ecg_data_count;
global Max_Sample_Size
ppg_text =[];
ecg_text =[];
ecg_text1 =[];
hr_array = [];
hr_count =0;
Max_Sample_Size = 50;
ppg_data_count =0;
ecg_data_count =0;
SAMPLE_WINDOW = 110;
bp_calculated =0;
num_data_available =0;
T =0:0.005:((Max_Sample_Size/2)-1)*0.005;
eT =0:0.005:((Max_Sample_Size/2)-1)*0.005;
ppg =[];
ppg_for_bp= [];
ecg =[];
sbp =[];
dbp =[];
data1 = [];
data2 = [];
PPGID = fopen("rawPPGData.txt","w+");
ECGID = fopen("rawECGData.txt","w+");
ble_devices = blelist;
s_ble_devices =size(ble_devices);
for index=1:s_ble_devices(1)
    if(ble_devices.Name(index) == "ESP32")
        disp("ESP32 Device found")
        break;
    end
end
PPG = ble("ESP32");
PPG_c = PPG.Characteristics
s_PPG_c = size(PPG_c);
for index=1:s_PPG_c(1)
    if(PPG_c.ServiceName(index) == "Custom")
        disp("Service name custom is found")
        break;
    end
end
num = characteristic(PPG, PPG_c.ServiceUUID(index), PPG_c.CharacteristicUUID(index) );
%num1 = characteristic(PPG, PPG_c.ServiceUUID(index+1), PPG_c.CharacteristicUUID(index+1) );
subscribe(num);
disp('num subscribe completed');
%subscribe(num1);
%disp('num1 subscribe completed');
num.DataAvailableFcn = @(src,event)PPGdisplayCharacteristicData(src,event,PPGID);
%num1.DataAvailableFcn = @(src,event)ECGdisplayCharacteristicData(src,event,ECGID);
kbhit('init');
key = kbhit;
while(isempty(key))
     key = kbhit;
end
fclose(PPGID);
fclose(ECGID);
unsubscribe(num);
num.PPGDataAvailableFcn = [];

