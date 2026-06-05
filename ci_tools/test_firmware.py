from conftest import send_command

def test_version(dut):
    resp = send_command(dut, "version")
    assert 'Version="' in resp

def test_led_on(dut):
    resp = send_command(dut, "led on")
    assert "OK" in resp