import os
import json
import threading
import time
from flask import Flask, render_template, request, jsonify
import subprocess

app = Flask(__name__)

BASE_DIR = './oop-car-service/queues/'
MAIN_QUEUE_DIR = os.path.join(BASE_DIR, 'main_queue')
STATIONS_DIR = os.path.join(BASE_DIR, 'stations')

data = {
    "main_queue": [],
    "stations": {}
}

ruby_process = None

def read_queue(folder_path):
    cars = []
    if os.path.exists(folder_path):
        for file_name in sorted(os.listdir(folder_path)):
            if file_name.endswith('.json'):
                file_path = os.path.join(folder_path, file_name)
                try:
                    with open(file_path, 'r') as f:
                        car_data = json.load(f)
                        cars.append(car_data.get('description', file_name))
                except Exception as e:
                    print(f"Error reading {file_path}: {e}")
    return cars

def update_data():
    while True:
        # Update main queue
        data["main_queue"] = read_queue(MAIN_QUEUE_DIR)

        # Update station queues
        stations = {}
        if os.path.exists(STATIONS_DIR):
            for station_name in sorted(os.listdir(STATIONS_DIR)):
                station_path = os.path.join(STATIONS_DIR, station_name)
                if os.path.isdir(station_path):
                    stations[station_name] = read_queue(station_path)
        data["stations"] = stations

        time.sleep(0.5)

@app.route('/')
def index():
    return render_template('index.html', main_queue=len(data["main_queue"]), stations={k: len(v) for k, v in data["stations"].items()})

@app.route('/start-service', methods=['POST'])
def start_service():
    global ruby_process
    if ruby_process is None or ruby_process.poll() is not None:  # Check if process is not running
        ruby_script_path = os.path.join('./oop-car-service/car-service/', 'main.rb')
        try:
            ruby_process = subprocess.Popen(['ruby', ruby_script_path])
            return jsonify({"status": "success"}), 200
        except Exception as e:
            print(f"Error starting Ruby script: {e}")
            return jsonify({"status": "error", "message": str(e)}), 500
    else:
        return jsonify({"status": "error", "message": "Service already running"}), 400

if __name__ == '__main__':
    update_thread = threading.Thread(target=update_data, daemon=True)
    update_thread.start()

    app.run(debug=True)
