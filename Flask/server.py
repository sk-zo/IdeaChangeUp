from flask import Flask, request, jsonify, render_template
from sentence_transformers import SentenceTransformer, util
import os
import numpy as np
import torch
import requests
import pickle


with open("embedset", 'rb') as f:
	embedset = pickle.load(f)

model = SentenceTransformer("jhgan/ko-sroberta-multitask")
top_k = 10


def calc_sim(ipc, abs):
    indexes = embedset['id']
    embeds = embedset['embed']

    indexes = torch.tensor(indexes)
    embeds = torch.tensor(embeds)

    abs_emb = model.encode(abs, convert_to_tensor=True).cpu()
    
    cos_sims = util.pytorch_cos_sim(abs_emb, embeds)[0]
    top_k_index = np.argpartition(-cos_sims, range(top_k))[0:top_k]
    top_k_score = cos_sims[top_k_index]
    
    return {'index':indexes[top_k_index].tolist(), 'score':top_k_score.tolist()}

app = Flask(__name__)

@app.route("/", methods=["GET", "POST"])
def root():
    if request.method=="POST":
        contents=request.get_json(force=True,silent=True)
        result = calc_sim(contents['ipc'], contents['abs'])
        return jsonify(result)
    else:
        return render_template("/")

if __name__ == '__main__':
    app.run(host='0.0.0.0', debug=True)