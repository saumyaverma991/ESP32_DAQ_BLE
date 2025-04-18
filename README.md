# ESP32_DAQ_BLE
🔬 BLE-Based Multi-Channel Biomedical Telemetry System using ESP32 and MATLAB
This project implements a Bluetooth Low Energy (BLE) based multi-channel Data Acquisition (DAQ) system for real-time biomedical signal monitoring, designed to run on an ESP32 microcontroller and interface with MATLAB for data visualization.

The system collects physiological signals like PPG (Photoplethysmogram) and ECG (Electrocardiogram) through analog sensors connected to the ESP32, transmits the data over BLE, and displays live plots and performs signal processing using MATLAB scripts.

📦 Features
🔋 Low-power BLE communication using ESP32 for extended battery life in wearable applications.

💓 Multi-channel acquisition (e.g., ECG and PPG) at 200 Hz sampling rate.

📡 BLE notification-based data transfer to ensure efficient wireless streaming.

📊 Real-time visualization of ECG/PPG signals in MATLAB.

💻 MATLAB scripts for:

BLE device connection

Live data plotting

Signal processing (e.g., heart rate estimation, BP prediction)

Optional TCP communication mode (Wi-Fi based)

🛠️ Custom UUIDs for BLE services and characteristics.

🧠 System Architecture
ESP32 (Peripheral):

Acquires analog data from ECG/PPG sensors.

Sends packed data over BLE using notifications.

PC with MATLAB (Central):

Connects to ESP32 over BLE.

Subscribes to characteristic updates.

Processes and visualizes incoming biomedical data.

🔌 Hardware Requirements
ESP32 Dev Board (with BLE support)

ECG Module (e.g., AD8232)

PPG/Pulse Sensor

USB cable

PC with Bluetooth and MATLAB installed

🚀 Getting Started
📲 ESP32 Firmware (Arduino IDE)
Open BLE_notify.ino in Arduino IDE.

Connect sensors to GPIO35 (ADC1_CH7) and GPIO34 (ADC1_CH6).

Upload the code to your ESP32.

ESP32 starts advertising BLE with custom service and characteristic UUIDs.

💻 MATLAB (PC)
Turn on Bluetooth and ensure PC supports BLE.

Run ble_server.m to connect to ESP32 and subscribe to data.

Use PPGdisplayCharacteristicData.m to plot PPG and extract features.

(Optional) Extend to TCP mode using tcp_client.m.


