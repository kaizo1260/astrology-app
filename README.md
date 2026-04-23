# Astrology App

A modern web interface for the Astrologer API - providing interactive astrology chart generation and analysis.

## Features

- 🌙 **Birth Charts** - Generate natal charts with customizable rendering options
- 🔄 **Synastry Charts** - Analyze relationships between two people
- 🎯 **Composite Charts** - Create composite charts from two subjects
- ⭐ **Transit Charts** - See current planetary transits
- 🌟 **Solar & Lunar Returns** - Calculate return charts
- 💕 **Compatibility Score** - Get relationship compatibility analysis
- 📊 **Moon Phase** - Real-time moon phase information
- 🎨 **Dark Theme UI** - Modern dark-themed interface with responsive design

## Quick Start

### Prerequisites
- Python 3.11+
- Node.js (for Vercel deployment)

### Local Development

1. **Clone the repository**
```bash
git clone https://github.com/kaizo1260/astrology-app.git
cd astrology-app
```

2. **Set up Python environment**
```bash
# Create virtual environment
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate

# Install dependencies
cd Astrologer
pip install -e ".[dev]"
```

3. **Run the API server**
```bash
poe dev
# or
uvicorn app.main:app --reload --log-level debug
```

The API will be available at `http://localhost:8000`

4. **Open the web interface**
Open `demo.html` in your browser or serve it via a simple HTTP server:
```bash
python -m http.server 8080
# Then open http://localhost:8080/demo.html
```

## API Endpoints

- `POST /api/v5/chart/birth-chart` - Generate birth chart
- `POST /api/v5/chart/now` - Current moment chart
- `POST /api/v5/chart/synastry` - Synastry (relationship) chart
- `POST /api/v5/chart/composite` - Composite chart
- `POST /api/v5/chart/transit` - Transit chart
- `POST /api/v5/chart/solar-return` - Solar return chart
- `POST /api/v5/chart/lunar-return` - Lunar return chart
- `POST /api/v5/compatibility-score` - Relationship compatibility
- `POST /api/v5/subject` - Subject data (planets, aspects)
- `POST /api/v5/moon-phase` - Moon phase information
- `POST /api/v5/moon-phase/now-utc` - Current moon phase

## Project Structure

```
.
├── Astrologer/                    # Backend API
│   ├── app/
│   │   ├── main.py               # FastAPI application
│   │   ├── routers/              # API endpoint handlers
│   │   ├── config/               # Configuration
│   │   └── types/                # Request/response models
│   ├── pyproject.toml            # Python dependencies
│   └── tests/                    # Test suite
├── demo.html                      # Frontend UI (single-file)
├── vercel.json                    # Vercel deployment config
└── README.md
```

## Configuration

### Environment Variables
Create a `.env` file in the `Astrologer/` directory:

```
ENV_TYPE=dev
LOG_LEVEL=INFO
```

For RapidAPI integration (optional):
```
RAPID_API_SECRET_KEY=your_key
RAPID_API_KEY=your_key
```

## Deployment

### Frontend: Vercel (demo.html)

Deploy the frontend to Vercel:

1. Push to GitHub (main branch)
2. Connect repository to Vercel at https://vercel.com/new
3. Select this repository
4. Vercel will auto-deploy on every push

**Live Demo:** https://astrology-app-tau.vercel.app

### Backend: Astrologer API

The API needs to be deployed separately. You have several options:

#### Option A: Railway (Recommended)
1. Go to https://railway.app
2. Create new project → GitHub
3. Select the `Astrologer` folder
4. Railway will auto-detect it as Python
5. Set `ENV_TYPE=production` in variables
6. Get your API URL (e.g., `https://astrology-api.railway.app`)

#### Option B: Render.com
1. Go to https://render.com
2. New → Web Service
3. Connect GitHub
4. Set build & start commands:
   - Build: `cd Astrologer && pip install -e .`
   - Start: `uvicorn app.main:app --host 0.0.0.0 --port $PORT`

#### Option C: Heroku
```bash
cd Astrologer
heroku create astrology-api
git push heroku main
```

### Connecting Frontend to Backend

After deploying the API, use it in the frontend:

```
https://astrology-app-tau.vercel.app?api=https://your-api-url.com
```

For example:
```
https://astrology-app-tau.vercel.app?api=https://astrology-api.railway.app
```

The `?api=` query parameter overrides the API endpoint.

## Technologies Used

- **Backend**: FastAPI, Python 3.11+
- **Astrology**: Kerykeion v5.12.8 (Swiss Ephemeris)
- **Frontend**: HTML5, CSS3, Vanilla JavaScript
- **Validation**: Pydantic
- **Hosting**: Vercel

## Support

For issues with:
- **Astrologer API**: https://github.com/g-battaglia/Astrologer-API
- **Kerykeion Library**: https://github.com/g-battaglia/kerykeion

## License

AGPL-3.0 (inherited from Astrologer API)

---

**Made with ☀️ ☾ ★**
