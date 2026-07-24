# Calculadora Securitizadora — Vedrà (site online)

Página estática (HTML/CSS/JS puro) da calculadora de resultado trimestral (Lucro Real) da Vedrà Securitizadora, pronta para hospedagem no **Railway** como um projeto/serviço **separado** do sistema atual.

## Estrutura
```
vedra-online/
├─ index.html            # a calculadora (tudo inline)
├─ assets/               # logos oficiais (vedra-logo-simbolo.png, vedra-logo-branco.png)
├─ Dockerfile           # nginx servindo o estático na porta $PORT do Railway
├─ nginx.conf.template  # config do nginx (usa a porta injetada pelo Railway)
├─ railway.json         # build via Dockerfile
└─ .dockerignore
```

## Deploy no Railway (projeto novo, link separado)

### Opção A — via este assistente (conector Railway)
Depois de autorizar o conector do Railway, peça: "faça o deploy". Eu crio um **projeto novo**, subo estes arquivos e gero o domínio público.

### Opção B — pelo painel do Railway
1. Acesse https://railway.com → **New Project** → **Deploy from GitHub repo** (ou **Empty Project** + upload).
2. Aponte para a pasta `vedra-online/`.
3. O Railway detecta o `Dockerfile` e faz o build automaticamente.
4. Em **Settings → Networking → Generate Domain** para criar a URL pública (ex.: `vedra-calc-production.up.railway.app`).

### Opção C — via Railway CLI
```bash
npm i -g @railway/cli
railway login
cd vedra-online
railway init          # cria um projeto novo
railway up            # build + deploy
railway domain        # gera o domínio público
```

## Domínio próprio (opcional)
Em **Settings → Networking → Custom Domain**, adicione algo como `calculadora.seudominio.com.br` e configure o CNAME indicado no seu DNS.

## Observações
- A porta é lida de `$PORT` (Railway injeta automaticamente).
- Substitua o símbolo SVG do cabeçalho pelos PNGs oficiais colocando-os em `assets/` e ajustando o `<header>` no `index.html`.
- As fórmulas tributárias são estimativas — confira contra a modelagem contábil oficial antes de uso em decisão.
