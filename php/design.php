<?php
// Section 1 functions
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

  function connectToBusThing(){
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

  function getTableData($tableName){
    // $conn = connectToBusThing();
    // $queryGetDriversTable = "SELECT * FROM {:tableName}";
    // $preparedStatement = $conn->prepare($queryGetDriversTable);
    // $preparedStatement->bindValue(':tableName', $tableName);
    // $preparedStatement->execute();
    // return $preparedStatement->fetchAll();

    $conn = connectToBusThing();
    $queryGetDriversTable = "SELECT * FROM {$tableName}";
    $results = $conn->query($queryGetDriversTable);
    $tableData = $results->fetchAll();
    $conn = NULL;
    return $tableData;
  }

  function getTableColumnNames($tableName){
    // $conn = connectToBusThing();
    // $queryGetDriversTable = "SELECT COLUMN_NAME from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME = :tableName ";
    // $preparedStatement = $conn->prepare($queryGetDriversTable);
    // $preparedStatement->bindValue(':tableName', $tableName);
    // $preparedStatement->execute();
    // return $preparedStatement->fetchAll();

    $conn = connectToBusThing();
    $queryGetDriversTable = "SELECT COLUMN_NAME from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME = '{$tableName}' ";
    $results = $conn->query($queryGetDriversTable);
    $tableColumnNames = $results->fetchAll();
    $conn = NULL;
    return $tableColumnNames;
  }

  // Section 2 Database interaction
  // try{
  //   $conn = new PDO('mysql:host=localhost;dbname=bus_thing', 'bus_thing', 'bustling');
  //   $conn->setAttribute( PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION );
  // }
  // catch (PDOException $exception)
  // {
  // 	echo "Database connection failed." . $exception->getMessage();
  // }

  $driversData = getTableData("drivers");
  // print_r($driversData);
  $driversColumnNames = getTableColumnNames("drivers");
  // print_r($driversColumnNames);


  // Section ??? Test stuff

?>

<!DOCTYPE HTML>
 	<html>
   	<head>
     	<title>Design</title>
     	<meta http-equiv="content-type" content="text/html;charset=utf-8" />
      <link href="../css/style.css" rel="stylesheet" type="text/css">
   	</head>
   	<body>
      <?php arrayToTable($driversData, $driversColumnNames, "Drivers Table") ?>
   	</body>
 	</html>
