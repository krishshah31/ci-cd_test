import pytest, serial
import time

PORT = "/dev/ttyACM0"
BAUD = 115200

@pytest.fixture
def dut():
    s = serial.Serial(PORT, BAUD, timeout=2)
    yield s
    s.close()

def send_command(s, cmd):
    s.reset_input_buffer()
    s.write((cmd + "\r\n").encode())
    time.sleep(0.3)
    return s.read(200).decode(errors="ignore")