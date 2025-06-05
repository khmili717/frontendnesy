if __name__ == '__main__':
    print("🚀 Starting Flask AI Prediction Server...")
    print("📡 Server will be accessible at:")
    print("   - Local: http://127.0.0.1:5000")
    print("   - Network: http://0.0.0.0:5000")
    print("   - Android Emulator: http://10.0.2.2:5000")
    print("   - Real Device: http://YOUR_COMPUTER_IP:5000")
    print("🔧 Endpoints available:")
    print("   - POST /predict - AI prediction with image response")
    print("   - GET /model-info - Model feature information")
    print("   - GET /db-status - Database connectivity check")
    print("=" * 50)
    
    app.run(debug=True, host='0.0.0.0', port=5000, threaded=True) 