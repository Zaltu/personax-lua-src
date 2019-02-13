from pprint import pprint as pp
import datetime

from shotgun_api3 import Shotgun


WEEKDAY = 57
WEEKEND = 65


date = datetime.date.today()
batchData = []
for i in range(1, 366):
    dayType = WEEKDAY if date.weekday() in range(0, 5) else WEEKEND
    batchData.append({
        'request_type': 'create',
        'entity_type': 'CustomEntity15',
        'data': {
            'project': {'type':'Project', 'id':70},
            'sg_story_day': date.strftime("%Y-%m-%d"),
            'sg_status_list': 'wtg',
            'task_template': {'type': "TaskTemplate", 'id':dayType}
        }
    })
    date += datetime.timedelta(days=1)


pp(batchData)
sg = Shotgun('', '', '')
sg.batch(batchData)



#pp(date.strftime("%Y-%m-%d"))
#date += datetime.timedelta(days=1)
#pp(date.strftime("%Y-%m-%d"))