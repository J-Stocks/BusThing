<?php
// Uses an array of table data, an array of table headings and a caption (string) to construct a html table presenting the data. Gives an error message if the number of headers does not match the number of columns in the table data.
  function arrayToTable($tableData, $tableHeadings, $caption){
    if ((count($tableData[0])/2) !== count($tableHeadings)){
      echo "Header count and column count must match.";
    } else if (count($tableData) === 0) {
      echo "Empty table data.";
    } else {
?>
<table>
  <caption><?php echo $caption; ?></caption>
  <thead>
    <tr>
<?php
      foreach ($tableHeadings as $tableHeading) {
        echo "<td>{$tableHeading[0]}</td>";
      }
?>
  </tr>
</thead>
<tbody>
<?php
      foreach ($tableData as $tableRow) {
        echo "<tr>";
        for ($i=0; $i < (count($tableRow)/2); $i++) {
          echo "<td>{$tableRow[$i]}</td>";
        }
        echo "</tr>";
      }
?>
  </tbody>
</table>
<?php
    }
  }

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

// Given the name of a table in the database this function returns the data in that table.
  function getTableData($tableName){
    $conn = getBusThingConnection();
    $queryGetDriversTable = "SELECT * FROM {$tableName}";
    $results = $conn->query($queryGetDriversTable);
    $tableData = $results->fetchAll();
    $conn = NULL;
    return $tableData;
  }

// Given the name of a table in the database this function returns the names of all columns in the table.
  function getTableColumnNames($tableName){
    $conn = getBusThingConnection();
    $queryGetDriversTable = "SELECT COLUMN_NAME from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME = '{$tableName}' ";
    $results = $conn->query($queryGetDriversTable);
    $tableColumnNames = $results->fetchAll();
    $conn = NULL;
    return $tableColumnNames;
  }

// Using the above functions we get all the data we need for all the tables in the database.
  $driversData = getTableData("drivers");
  $driversColumnNames = getTableColumnNames("drivers");
  $busesData = getTableData("buses");
  $busesColumnNames = getTableColumnNames("buses");
  $stopsData = getTableData("stops");
  $stopsColumnNames = getTableColumnNames("stops");
  $routesData = getTableData("routes");
  $routesColumnNames = getTableColumnNames("routes");
  $route_stopData = getTableData("route_stop");
  $route_stopColumnNames = getTableColumnNames("route_stop");
  $runsData = getTableData("runs");
  $runsColumnNames = getTableColumnNames("runs");

// Main page html begins here.
?>

<!DOCTYPE HTML>
  <html>
    <head>
      <title>BusThing - Design</title>
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
        <main>
          <h2>Class Diagram</h2>
          <img src="../images/class_diagram.png" alt="BusThing database class diagram.">
          <h2>Physical Data Model</h2>
          <img src="../images/data_model.png" alt="BusThing database physical data model.">
          <h2>Database Tables</h2>
<?php

?>
          <?php arrayToTable($driversData, $driversColumnNames, "Drivers Table") ?>
          <?php arrayToTable($busesData, $busesColumnNames, "Buses Table") ?>
          <?php arrayToTable($stopsData, $stopsColumnNames, "Stops Table") ?>
          <?php arrayToTable($routesData, $routesColumnNames, "Routes Table") ?>
          <?php arrayToTable($route_stopData, $route_stopColumnNames, "route_stop Table") ?>
          <?php arrayToTable($runsData, $runsColumnNames, "Runs Table") ?>
        </main>
        <div id="rightPad"></div>
        <footer>Copyright © 2018 Joshua Stocks U1757754. All rights reserved.</footer>
      </div>
    </body>
  </html>
