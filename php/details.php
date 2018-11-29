<?php
// Connect to the database.
  try{
         $conn = new PDO('mysql:host=localhost;dbname=bus_thing', 'bus_thing', 'bustling');
         $conn->setAttribute( PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION );
  }
  catch (PDOException $exception)
  {
    echo "Database connection failed" . $exception->getMessage();
  }

// Setting up the basic info about this page, what route this timetable is for, todays date, how far from the current date should the displayed timetables be.
  $routeId = $_GET["route_id"];
  $today = date("Y-m-d");
  if (array_key_exists("run_offset", $_GET)) {
    $runOffset = $_GET["run_offset"];
  } else {
    $runOffset = 0;
  }

// Get the ids of the runs that will be shown on this page.
  $queryGetRunIds = "SELECT runs.run_id FROM runs WHERE runs.route_id = {$routeId} AND runs.start_time > :today ORDER BY runs.start_time ASC LIMIT 5 OFFSET {$runOffset}";
  $prepRunIds=$conn->prepare($queryGetRunIds);
  $prepRunIds->bindValue(':today',$today);
  $prepRunIds->execute();
  $runIDs = $prepRunIds->fetchAll();

  $inString = "";
  for ($i=0; $i < count($runIDs); $i++) {
    if ($i === 0) {
      $inString = "{$runIDs[0][0]}";
    } else {
      $inString = $inString.", ". $runIDs[$i][0];
    }
  }

//Get the data that will be used to build the timetable.

  $queryGetRouteDetails = "SELECT runs.start_time, stops.stop_name, route_stop.time_offset, routes.route_name FROM runs INNER JOIN routes ON runs.route_id = routes.route_id INNER JOIN route_stop ON routes.route_id = route_stop.route_id INNER JOIN stops ON route_stop.stop_id = stops.stop_id WHERE runs.run_id IN ($inString) ORDER BY runs.start_time ASC, route_stop.stop_number ASC";
  $resultsRouteDetails = $conn->query($queryGetRouteDetails);
  $rawRouteData = $resultsRouteDetails->fetchAll();

// Get the number of stops on the route.
  $queryGetNumberOfStops = "SELECT stop_number FROM route_stop WHERE route_id = {$routeId} ORDER BY stop_number DESC LIMIT 1";
  $resultsNumberOfStops = $conn->query($queryGetNumberOfStops);
  $stopCount = ($resultsNumberOfStops->fetch())[0];

// Get the number of future runs of this route.
  $queryGetNumberOfRuns = "SELECT COUNT(*) FROM runs WHERE route_id = {$routeId} AND runs.start_time > :today ORDER BY runs.start_time";
  $prepNumberOfRuns=$conn->prepare($queryGetNumberOfRuns);
  $prepNumberOfRuns->bindValue(':today',$today);
  $prepNumberOfRuns->execute();
  $runCount = ($prepNumberOfRuns->fetchAll())[0][0] - $runOffset;

// Get the start times of the runs of this route.
  $queryGetRunStarts = "SELECT start_time FROM runs WHERE runs.run_id IN ($inString) ORDER BY start_time ASC";
  $resultsGetRunStarts = $conn->query($queryGetRunStarts);
  $runStartTimes = $resultsGetRunStarts->fetchAll();

// Get the bus icons.
  $queryGetBusIcons = "SELECT icons.url, icons.alt_text FROM runs INNER JOIN buses ON runs.bus_reg = buses.registration INNER JOIN icons ON buses.icon_id = icons.icon_id WHERE runs.run_id IN ($inString)";
  $resultsBusIcon = $conn->query($queryGetBusIcons);
  $busIcons = $resultsBusIcon->fetchAll();

// Get related routes.
  $queryRelatedRoutes = "SELECT DISTINCT routes.route_id, routes.route_name
    FROM stops INNER JOIN route_stop ON stops.stop_id = route_stop.stop_id INNER
    JOIN routes ON route_stop.route_id = routes.route_id WHERE stops.stop_id IN
    (SELECT stops.stop_id FROM routes INNER JOIN route_stop ON routes.route_id =
    route_stop.route_id INNER JOIN stops ON route_stop.stop_id = stops.stop_id
    WHERE routes.route_id = {$routeId}) AND routes.route_id <> {$routeId} LIMIT 5";
  $resultsRelatedRoutes = $conn->query($queryRelatedRoutes);
  $relatedRoutes = $resultsRelatedRoutes->fetchAll();

// Close the connection to the database.
  $conn = NULL;

// 5 or fewer runs can be shown on one page.
  if ($runCount <= 5) {
    $runsToShow = $runCount;
  } else {
    $runsToShow = 5;
  }

// Converts the raw route data of time offsets and a start time to a table of times.
  $routeTimeTable = [];

  for ($j=0; $j < $runsToShow; $j++) {
    $rowOffset = $j * $stopCount;
    $runningTime = strtotime($rawRouteData[$rowOffset + 1]["start_time"]);
    $tempRouteArray = [date("G:i A" ,$runningTime)];
    for ($i=1; $i < $stopCount; $i++) {
      $runningTime = $runningTime + $rawRouteData[$rowOffset + $i]["time_offset"] * 60;
      array_push($tempRouteArray, date("G:i A" ,$runningTime));
    }
    array_push($routeTimeTable, $tempRouteArray);
  }

  $stopNames = [];
  for ($i=0; $i < $stopCount; $i++) {
    array_push($stopNames, $rawRouteData[$i]["stop_name"]);
  }
?>

<!DOCTYPE HTML>
  <html>
    <head>
      <title>BusThing - <?php echo $rawRouteData[0]["route_name"]; ?></title>
      <meta http-equiv="content-type" content="text/html;charset=utf-8" />
      <link href="../css/style.css" rel="stylesheet" type="text/css">
    </head>
    <body>
      <div id="holder">
        <div class="headerPad"></div>
        <header>
          <h1 id="logo"><a href="index.php">BusThing</a></h1>
          <nav>
            <ul id="navLinks" class="flexStart">
              <li><a href="../php/index.php?browse=true">Browse Routes</a></li>
              <li><a href="../php/design.php">Design</a></li>
            </ul>
          </nav>
          <form action="index.php" method="get" id="hearderSearch">
            <label for="searchString" id="searchLabel">Search:</label>
            <input type="text" name="searchString" id="search">
            <input type="submit" name="submitSearch" value="Go">
          </form>
        </header>
        <div class="headerPad"></div>
        <div id="leftPad"></div>
        <main class="flexCenter">
          <div class="flexStart flexCol">
            <table class="timeTable">
              <caption><?php echo $rawRouteData[0]["route_name"]; ?></caption>
              <thead>
                <tr>
                  <td rowspan="2">Stop Names</td>
                  <td colspan="<?php echo $runsToShow; ?>">Departure Times</td>
                </tr>
                <tr>
<?php
  for ($i=0; $i < $runsToShow; $i++) {
    $tempTime = date("d-M-Y", strtotime($runStartTimes[$i][0]));
    echo "<td>{$tempTime}</td>";
  }
?>
                </tr>
              </thead>
              <tbody>
<?php
  for ($i=0; $i < $stopCount; $i++) {
    echo "<tr>";
    echo "<td>{$stopNames[$i]}</td>";
    for ($j=0; $j < $runsToShow; $j++) {
      echo "<td>{$routeTimeTable[$j][$i]}</td>";
    }
    echo "</tr>";
  }
?>
              </tbody>
              <tfoot>
                <tr>
                  <td>Bus Type</td>
<?php
  for ($i=0; $i < $runsToShow; $i++) {
    echo "<td><img src='{$busIcons[$i]['url']}' alt='{$busIcons[$i]['alt_text']}'</td>";
  }
?>
                </tr>
              </tfoot>
            </table>
            <div id="backAndForward">
<?php
  echo "<p>";
  if ($runOffset > 0) {
    if ($runOffset - 5 >= 0) {
      $prevOffset = $runOffset - 5;
    } else {
      $prevOffset = 0;
    }
    echo "<a href='details.php?route_id={$routeId}&run_offset={$prevOffset}'>Previous Runs</a>";
  } else {
    echo "&nbsp;";
  }
  echo "</p>";
  echo "<p>";
  if ($runCount > $runsToShow) {
    $nextOffset = $runOffset + 5;
    echo "<a href='details.php?route_id={$routeId}&run_offset={$nextOffset}'>Next Runs</a>";
  } else {
    echo "&nbsp;";
  }
  echo "</p>";
?>
            </div>
            <div>
<?php
  if (count($relatedRoutes) > 0) {
?>
            <div>
              <h2>Nearby Routes</h2>
              <ul id="relatedRoutes">
<?php
    foreach ($relatedRoutes as $relatedRoute) {
      echo "<li><a href='details.php?route_id={$relatedRoute["route_id"]}'>{$relatedRoute["route_name"]}</a></li>";
    }
?>
              </ul>
            </div>
<?php
  }
?>
          </div>
        </main>
        <div id="rightPad"></div>
        <footer>Copyright © 2018 Joshua Stocks U1757754. All rights reserved.</footer>
      </div>
    </body>
  </html>
