import requests

def test_home_endpoint_regression():
    resp = requests.get('http://localhost:5000/')
    assert resp.status_code == 200
    data = resp.json()
    assert 'message' in data
    assert 'hello' in data['message']
