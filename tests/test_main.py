from fastapi.testclient import TestClient


def test_main(client: TestClient) -> None:
    assert client.get("/").status_code == 200
