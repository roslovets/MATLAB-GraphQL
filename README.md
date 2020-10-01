# MATLAB GraphQL Client

Connect to [GraphQL](https://graphql.org/) API form MATLAB

![image_0.png](README_images/image_0.png)

## How it works

Provided `GraphQL` class helps you to appropriately encode data, prepare query and call GraphQL endpoint via regular HTTP POST request under the hood according to official [documentation](https://graphql.org/learn/serving-over-http/).

## How to install

Open **GraphQL_Client.mltbx** to install toolbox.

## How to embed in your project

If you want to make GraphQL Client a part of your project without installing toolbox just add `GraphQL.m` class to your project.

## Examples
### Example 1. Simple Query

\hfill \break

```matlab:Code
% Define endpoint URL
url = 'https://api.graphql.jobs/';
% Compose query
query = 'query{jobs{title,applyUrl,postedAt}}';
% Create GraphQL object with predefined web options
g = GraphQL(url, 'Query', query);
% Execute query
res = g.execute();
% Extract data
jobs = struct2table(res.data.jobs);
% Convert dates to datetime format
jobs.postedAt = GraphQL.datetime(jobs.postedAt);
head(jobs, 3)
```

| |title|applyUrl|postedAt|
|:--:|:--:|:--:|:--:|
|1|'Senior Fullstack En...|'https://grnh.se/2d8...|2019-08-12T20:19:52....|
|2|'Full Stack JavaScri...|'https://docs.google...|2019-08-12T12:58:28....|
|3|'Senior Software Eng...|'mailto:karolis.mazu...|2019-08-12T10:47:47....|

### Example 2. Encoding data

\hfill \break

```matlab:Code
% Define endpoint URL
url = 'https://countries-274616.ew.r.appspot.com/';
% Create filter structure
filter = struct('filter', struct('area_gt', 1e7));
% Encode filter structure to string
filterstr = GraphQL.encode(filter);
% Compose query with filter argument
query = sprintf('query{Country(%s){name,area,population}}', filterstr);
% Create GraphQL object
g = GraphQL(url, 'Query', query);
% Execute query
res = g.execute();
% Extract data
res.data.Country
```

|Fields|name|area|population|
|:--:|:--:|:--:|:--:|
|1|'Antarctica'|14000000|1000|
|2|'Russian Federation'|17124442|146599183|

### Example 3. Add API key (change request options)

\hfill \break

```matlab:Code
% Define endpoint URL
url = 'https://api.graphql.jobs/';
% Define your API key
apiKey = 'your_api_key';
% Create weboptions object (builtin in MATLAB) with specified header fields
opts = weboptions('HeaderFields', {'apiKey' apiKey});
% Optionally increase request timeout (usefull for heavy requests)
opts.Timeout = 10;
% Compose query
query = 'query{jobs{title,applyUrl,postedAt}}';
% Create GraphQL object with predefined web options
g = GraphQL(url, 'Query', query, 'WebOptions', opts);
% Execute query
res = g.execute();
```

2020, [Pavel Roslovets](https://roslovets.github.io)