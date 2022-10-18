from fastapi.testclient import TestClient

from my_fastapi_app.main import app

client = TestClient(app)



def test_read_main():
    response = client.get("/")
    assert response.status_code == 200
    assert response.json() == {"message": "Hello world from FastAPI"}

