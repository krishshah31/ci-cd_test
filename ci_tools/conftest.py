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
    buf = ""
    deadline = time.time() + 2
    while time.time() < deadline:
        buf += s.read(64).decode(errors="ignore")
        if "> " in buf and len(buf) > len(cmd) + 4:
            break
    return buf