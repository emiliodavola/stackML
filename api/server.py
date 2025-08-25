from fastapi import FastAPI
import mlflow

app = FastAPI()

@app.get("/health")
def health():
    return {"status": "ok"}

@app.post("/predict")
def predict():
    # placeholder: load model from mlflow when called (on-demand)
    # model = mlflow.pyfunc.load_model('models:/MyModel/Production')
    return {"prediction": None}
