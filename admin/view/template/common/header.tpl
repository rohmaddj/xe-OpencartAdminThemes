<!DOCTYPE html>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<head>
<meta charset="UTF-8" />
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content="<?php echo $keywords; ?>" />
<?php } ?>
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />
<!-- Xenon style -->

  <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Arimo:400,700,400italic">
  <link rel="stylesheet" href="view/assets/css/fonts/linecons/css/linecons.css">
  <link rel="stylesheet" href="view/assets/css/fonts/fontawesome/css/font-awesome.min.css">
  <link rel="stylesheet" href="view/assets/css/bootstrap.css">
  <link rel="stylesheet" href="view/assets/css/xenon-core.css">
  <link rel="stylesheet" href="view/assets/css/xenon-forms.css">
  <link rel="stylesheet" href="view/assets/css/xenon-components.css">
  <link rel="stylesheet" href="view/assets/css/xenon-skins.css">
  <link rel="stylesheet" href="view/assets/css/custom.css">

  <script src="view/assets/js/jquery-1.11.1.min.js"></script>
  <script src="view/javascript/common.js" type="text/javascript"></script>
  <?php foreach ($scripts as $script) { ?>
  <script type="text/javascript" src="<?php echo $script; ?>"></script>
  <?php } ?> 
<!-- end xenon -->
</head>
<body class="page-body">

  
    
  </div>
  
  <div class="page-container"><!-- add class "sidebar-collapsed" to close sidebar by default, "chat-visible" to make chat appear always -->
      
    <!-- Add "fixed" class to make the sidebar fixed always to the browser viewport. -->
    <!-- Adding class "toggle-others" will keep only one menu item open at a time. -->
    <!-- Adding class "collapsed" collapse sidebar root elements and show only icons. -->
    

