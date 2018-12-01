<?php
// Returns a connection to the BusThing database.
  function getBusThingConnection(){
    try{
      $conn = new PDO('mysql:host=localhost;dbname=bus_thing', 'bus_thing', 'bustling');
      $conn->setAttribute( PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION );
      return $conn;
    }
    catch (PDOException $exception)
    {
      echo "Database connection failed." . $exception->getMessage();
    }
  }

// Converts a string of search terms into an array of search terms, in lowercase with no non-alphanumeric characters.
  function searchStringToTerms($searchString){
    $charArray = str_split(strtolower($searchString));
    $filteredCharArray = array_filter($charArray, function($char){
      $acceptableChars = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '1', '2', '3', '4', '5', '6', '7', '8', '9', '0', " "];
      if (in_array($char, $acceptableChars)) {
        return true;
      }
      return false;
    });
    $filteredSearchString = implode($filteredCharArray);
    $rawSearchTerms = explode(" ", $filteredSearchString);
    $searchTerms = array_filter($rawSearchTerms, function($term){ return !empty($term); });
    $searchTerms = array_values($searchTerms);
    return $searchTerms;
  }

// Uses an array of search terms to construct an SQL query that searches for bus routes that have a name matching any of the search terms or include a stop with a name matching any of the search terms.
  function constructRouteSearchQuery($searchTerms){
    $queryBase = "SELECT DISTINCT routes.route_id, routes.route_name FROM routes INNER JOIN route_stop ON routes.route_id = route_stop.route_id INNER JOIN stops ON route_stop.stop_id = stops.stop_id WHERE ";
    $queryConditions = array_map(function($term){
      return "routes.route_name LIKE '%{$term}%' OR stops.stop_name LIKE '%{$term}%'";
    }, $searchTerms);
    $tempQuery = $queryBase.$queryConditions[0];
    for ($i=1; $i < count($queryConditions); $i++) {
      $tempQuery = $tempQuery." OR ".$queryConditions[$i];
    }
    return $tempQuery." ORDER BY routes.route_name;";
  }

// Depending in the postback infromation we either display the landing page, search results, route list or an error message. The state is stored in $pageVersion.
  $pageVersion; // 0 = first visit, 1 = successful search, 2 = failed search, 3 = Browse all routes.
  if (array_key_exists("searchString", $_GET)) {
    $userTerms = searchStringToTerms($_GET["searchString"]);
    if (count($userTerms) > 0) {
      $userQuery = constructRouteSearchQuery($userTerms);
      $conn = getBusThingConnection();
      $results = $conn->query($userQuery);
      $routesToShow = $results->fetchAll();
      $conn = NULL;
      $resultsCount = count($routesToShow);
      if ($resultsCount > 0) {
        $pageVersion = 1;
      } else {
        $pageVersion = 2;
      }
    } else {
      $pageVersion = 2;
    }
  } else if (array_key_exists("browse", $_GET)) {
    $conn = getBusThingConnection();
    $queryAllRoutes = "SELECT route_id, route_name FROM routes ORDER BY route_name ASC";
    $results = $conn->query($queryAllRoutes);
    $routesToShow = $results->fetchAll();
    $conn = NULL;
    $pageVersion = 3;
  } else {
    $pageVersion = 0;
  }

// Main page html begins here.
?>

<!DOCTYPE HTML>
  <html>
    <head>
      <title>BusThing</title>
      <meta http-equiv="content-type" content="text/html;charset=utf-8" />
      <link href="../css/style.css" rel="stylesheet" type="text/css">
    </head>
    <body>
      <div id="holder">
        <div class="headerPad vertCenter"></div>
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
            <input type="text" name="searchString" id="searchString">
            <input type="submit" name="submitSearch" value="Go">
          </form>
        </header>
        <div class="headerPad"></div>
        <div id="leftPad"></div>
        <main>
<?php
// Switch statement controlling the main.
  switch ($pageVersion) {
    case 0: //Fresh welcome page
      echo "<h2>Welcome to BusThing</h2>";
      break;
    case 1: //Search Results
      if ($resultsCount === 1) {
        echo "<h2>Your search found {$resultsCount} route.</h2>";
      } else {
        echo "<h2>Your search found {$resultsCount} routes.</h2>";
      }
      echo "<ul id='resultsList'>";
      foreach ($routesToShow as $route) {
        echo "<li><a href='details.php?route_id={$route["route_id"]}'>{$route["route_name"]}</a></li>";
      }
      echo "</ul>";
      break;
    case 2: //Failed search
      echo "<p>No routes match your search<p>";
      break;
    case 3;
      echo "<h2>Browse Routes</h2>";
      echo "<ul id='resultsList'>";
      foreach ($routesToShow as $route) {
        echo "<li><a href='details.php?route_id={$route["route_id"]}'>{$route["route_name"]}</a></li>";
      }
      echo "</ul>";
      break;
    default:
      echo "<p><a href='index.php'>An error has occured, return to the main page.</a></p>";
      break;
}
?>
        </main>
        <div id="rightPad"></div>
        <footer>Copyright © 2018 Joshua Stocks U1757754. All rights reserved.</footer>
      </div>
    </body>
  </html>
