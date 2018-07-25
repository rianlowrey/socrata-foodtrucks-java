Food truck listing query tool.

This application queries [San Francisco Mobile Food Schedule](https://dev.socrata.com/foundry/data.sfgov.org/bbb8-hzi6) to
print out a list of food trucks by `applicant` name and `location`, filtered by the current date/time matching
the applicant `start24`, `end24`, and `dayofweekstr` for the current local time of the current user,
and finally ordered by `applicant` name. Query results are fetched and paged into partitions of 10 listings.

## Getting Started

- From the project root, execute `./run.sh`
- Or, execute `./gradlew clean build run`
- At the prompt, press any key to step through the enumeration

## Follow-Up

- Key Technical Considerations
  - Current query payload nears 2 MB
  - Api endpoint may rate throttle due to abuse
  - Consumer interface requirements, i.e. user defined filtering and paging, location mapping

For the purposes of this exercise a query is performed using the [Socrata Soda Api](https://github.com/socrata/soda-java)
and is not cached. For larger scale needs we might consider making an effort to cache either a redundant copy
of the dataset, middle-tier/middleware caching; in either case cache validation will be a necessity. The second most
important consideration to make is what interface requirements might be needed. If we are to scale from a command line
interface to a multi/concurrent user interface several project level refactorings will have to occur.

In scaling from a simple consumer to a full-scale web application, ideally we would structure the client interfaces hierarchically.

For Example:

* Back-End DataSource or Upstream Client/Consumer
  * Front-End/Edge Service
    * Command-Line Service

Several important benefits are gained organizing the project in this manner. First, code re-use can be leveraged to
propigate necessary changes and minimizing the time needed to make any changes. Secondly, exploiting seperation of concerns
allow for us to make important design decisions reducing its impact to consumers. Thirdly, depending on interface requirements,
the tiered approach permits extensions to upstream apis/datasources potentially increasing value to prospective consumers.