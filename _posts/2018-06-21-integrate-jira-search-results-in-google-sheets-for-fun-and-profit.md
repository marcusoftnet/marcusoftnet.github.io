
This gives me all the tech items that have been resolved across all of Roar organizations in the last 30 days.

### Selecting Columns

Now, the default columns are great for reading this long list of items, but I want to do some stats. I just need the issue key, creation date, and resolution date. 

To select columns, click the `Columns` link to the right of the search. Then select the columns you want to store for this filter. They will be saved automatically.

### Setting Permissions

Always remember to set the right permissions for the filter before sharing it. Click the `Details -> Edit permissions` link next to the filter name and set the permissions to something useful. I usually select `Any logged in user` unless it's sensitive.

## Importing Data into Google Sheets

Exporting the list of issues is simple: click the `Export` button and select `CSV (Current fields)`. Then right-click `CSV (Current fields)` and copy the link address.

Open a new tab in your browser and paste that link in the address bar. Hit enter. The file will be downloaded for you.

Because of this, we can create a link in [Google Sheets](http://sheets.google.com/) to download the data.

## Crunching the Data

Once you've imported the data into Google Sheets, you can start crunching it. I've prepared [a sheet](https://docs.google.com/spreadsheets/d/138TWhYwnrK47OKUIrE-q7eknLYoDBZyhVieFFCWYSfA/edit#gid=70371573) with some calculations.

I usually color calculated cells differently to indicate they shouldn't be touched.

My sheet has 10 calculated columns. The first 4 calculate per row:

* **Link**: This creates a hyperlink back to the issue.
* **Leadtime in days**: This calculates the lead time by subtracting the creation date from the resolution date.
* **Week completed**: This gets the week for the resolved date.
* **Month completed**: This calculates the month for the resolved date.

I've then aggregated the weeks and months in the following columns.

## Drawing Diagrams

I've also created a few visualizations of the data. You can see them [here](https://docs.google.com/spreadsheets/d/138TWhYwnrK47OKUIrE-q7eknLYoDBZyhVieFFCWYSfA/edit#gid=1369250284).

### Throughput per Month

- Select the column N-P, all rows.
- Go to Insert -> Chart.
- The data range should be `N1:N1000,O1:P1000`.
- Move the Months to the X-axis series.
- Remove it from the Y-axis series and add it as an X-axis series.
- Select the Smooth line chart type.
- Make any additional formatting adjustments.

### Throughput per Week

Same as above, but use the data from `J1:L1000`.

### Leadtime per Issue

- Select Column D (Resolved) and F (Leadtime in days).
- Go to Insert -> Chart.
- Select a Scatter chart.
- Add a Polynominal trend line for the Leadtime in days series.
- Make any additional adjustments.

## Conclusion

Here are the diagrams we created:

![Diagrams](/img/diagrams.png)

Consider how easy this is to keep up to date. This is literally what I do once a week:

* Open the Google spreadsheet for our stats.
* Click the link in B1 on the Instruction sheet to download a file with the raw data, based on a filter kept in JIRA.
* Import the downloaded file to the JIRA raw data sheet.
* Done.

It takes about 10 seconds. And I'm pretty sure it can be totally automated—but I'll leave that for another post.

I hope you found this useful.
