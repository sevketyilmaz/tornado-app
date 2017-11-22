### 

1. Create a Virtual Environment - `pyvenv venv`.  For Python2, install `virtualenv venv`

2. Activate Virtual Environment - `source venv/bin/activate`.  For Windows, you may need `venv/scripts/activate`.

3. Install Requirments - `pip install -r requirements.txt`.  This will install Tornado Web Framework.

4. Run the App - `python run_server.py`

5. Open two browser Tabs for `http://localhost:9090` and Play the game.

### Run in Supervisor Process:

We want to serve the App under a Supervisor process so that we can Start / Stop and log errors in the app.

Let's install and configure Supervisor.

```
sudo apt-get install supervisor
sudo vi /etc/supervisor/conf.d/board-games-app.conf
<press i insert mode>


[program:board-games-app]
autostart = true
autorestart = true
command = /home/pi/projects/tornado-app/venv/bin/python /home/pi/projects/tornado-app/run_server.py --debug=False --port=80
numprocs = 1
startsecs = 10
stderr_logfile = /var/log/supervisor/tornado-app-err.log
stdout_logfile = /var/log/supervisor/tornado-app.log
environment = PYTHONPATH="/home/pi/projects/tornado-app/venv/bin/"

<escape :wq>

sudo supervisorctl reload

# Verify that App is running under Supervisor.
# You may need to wait to few seconds for it go from Starting to Running

sudo supervisorctl status


<Your APP is live now>
```
=============================================================

Alternatively you can pipe the data into mysql from the command line:

mysql -p < simple-model.sql
and
mysql -p < simple-data.sql



If the file doesn't specify a database then you will also need to add that:
mysql db_name < yourfile.sql

=============================================================
