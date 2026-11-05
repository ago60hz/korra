#!/usr/bin/env python3
"""Serve Korra.html on localhost and open it in the default browser.

Usage:  python3 serve.py [--port 5231] [--no-open]
Stop with Ctrl+C. Only Korra.html is served, and only on 127.0.0.1.
"""
import argparse
import http.server
import socketserver
import sys
import threading
import webbrowser
from pathlib import Path

HTML = Path(__file__).resolve().parent.parent / "Korra.html"


class Handler(http.server.BaseHTTPRequestHandler):
    def do_GET(self):
        if self.path.split("?")[0] in ("/", "/Korra.html", "/index.html"):
            body = HTML.read_bytes()
            self.send_response(200)
            self.send_header("Content-Type", "text/html; charset=utf-8")
            self.send_header("Content-Length", str(len(body)))
            self.send_header("Cache-Control", "no-store")
            self.end_headers()
            self.wfile.write(body)
        else:
            self.send_error(404)

    def log_message(self, *args):
        pass


def main():
    ap = argparse.ArgumentParser(description="Open Korra in your browser.")
    ap.add_argument("--port", type=int, default=5231)
    ap.add_argument("--no-open", action="store_true", help="print the URL only")
    args = ap.parse_args()

    if not HTML.exists():
        sys.exit(f"Korra.html not found at {HTML}")

    socketserver.TCPServer.allow_reuse_address = True
    server = None
    # Try the requested port, then the next few, then any free port.
    for port in [args.port + i for i in range(10)] + [0]:
        try:
            server = socketserver.TCPServer(("127.0.0.1", port), Handler)
            break
        except OSError:
            continue
    if server is None:
        sys.exit("Could not find a free port.")

    url = f"http://127.0.0.1:{server.server_address[1]}/"
    print(f"Korra is running at {url}", flush=True)
    print("Press Ctrl+C to stop.", flush=True)
    if not args.no_open:
        threading.Timer(0.4, lambda: webbrowser.open(url)).start()
    try:
        server.serve_forever()
    except KeyboardInterrupt:
        print("\nStopped.")
    finally:
        server.server_close()


if __name__ == "__main__":
    main()
