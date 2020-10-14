# Pessl FieldClimate datacloud

<http://fieldclimate.com>

API Access :
Pessl API Documentation:
<https://api.fieldclimate.com/v1/docs/>



## No data in components for 00206230

```
"2_X_X_501":{ "name":"Wetbulb temperature",
"3_X_X_143":{ "name":"Wind direction",
"5_X_X_6":{ "name":"Precipitation",         
"6_X_X_5":{"name":"Wind speed",         
```

## Multiple measures of same value 
How do I interpred this ?

```
"4002_0004A3852BA2_X_35329":{"name":"Leaf temperature (IR)",
"4005_0004A385CEF5_X_35329":{"name":"Leaf temperature (IR)",
```

```
"12001_X_15243_19969":{ "name":"EAG Soil moisture",
"12002_X_15243_19969":{ "name":"EAG Soil moisture",
"12003_X_15243_19969":{ "name":"EAG Soil moisture",
"12004_X_15243_19969":{ "name":"EAG Soil moisture",
"12005_X_15243_19969":{ "name":"EAG Soil moisture",
"12006_X_15243_19969":{ "name":"EAG Soil moisture",
```
same pattern for 
```
"12007_X_15243_20228":{         "name":"Eag soil salinity",
```
```
"12013_X_15243_17153":{         "name":"Soil temperature",
```
## Wind speed max vs wind speed max missmatch 

```
        "31_X_X_49": {
            "name": "Wind speed max",
            "name_custom": "Wind Speed Max",
            "decimals": 1,
            "unit": "m/s",
            "ch": 31,
            "code": 49,
            "group": 66,
            "serial": "X",
            "mac": "X",
            "vals": {
                "min": 0,
                "max": 32767
            },
            "aggr": {
                "max": [
                    1.3,
                    1.3,
                    2.1,
                    2.7,
                    2.8,
```
```
        "6_X_X_5": {
            "name": "Wind speed",
            "name_custom": "Wind Speed",
            "decimals": 1,
            "unit": "m/s",
            "ch": 6,
            "code": 5,
            "group": 6,
            "serial": "X",
            "mac": "X",
            "vals": {
                "min": 0,
                "max": 32767
            },
            "aggr": {
                "avg": [],
                "max": [
                    0.6,
                    0.3,
                    1.2,
                    1.5,
                    1.2,
```
