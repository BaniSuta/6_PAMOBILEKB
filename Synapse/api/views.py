import json
import pickle
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
import numpy as np


@csrf_exempt
def predict(request):
    if request.method == "GET":
        try:
            with open("api/model/garden/supercar_model.pkl", "rb") as f:
                model_data = pickle.load(f)
                ranking = model_data["df_ranked_ahp"]["Alternatif"]

            # Pastikan ranking berupa list Python standar
            if isinstance(ranking, np.ndarray):
                ranking = (
                    ranking.tolist()
                )  # Konversi ke list jika masih berupa NumPy array
            elif not isinstance(ranking, list):
                ranking = list(
                    ranking
                )  # Konversi ke list untuk tipe data lain yang iterable

            return JsonResponse({"prediction": ranking}, status=200)

        except json.JSONDecodeError:
            return JsonResponse({"error": "Invalid JSON format"}, status=400)
    else:
        return JsonResponse(
            {"error": "This endpoint only supports POST requests."}, status=405
        )


@csrf_exempt
def predict_image(request):
    if request.method == "POST":
        try:
            image = request.FILES.get("image")

            if image is None:
                return JsonResponse({"error": "No image provided"}, status=400)

            prediction = model.predict_from_image(image)

            return JsonResponse(
                {"message": "Image received", "prediction": prediction}, status=200
            )
        except json.JSONDecodeError:
            return JsonResponse({"error": "Invalid JSON format"}, status=400)
    else:
        return JsonResponse(
            {"error": "This endpoint only supports POST requests."}, status=405
        )
