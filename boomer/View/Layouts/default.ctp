<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title><?php echo $title_for_layout; ?></title>
        <?php echo $this->Html->css(array('reset.css', 'style.css')) ?>
        <?php echo $this->Html->script(array('jquery.js', 'controls.js')); ?>
        <?php echo $scripts_for_layout; ?>
        <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
    </head>
    <body>
        <?php echo $this->element('header'); ?>

        <?php echo $content_for_layout; ?>

        <?php echo $this->element('footer'); ?>
    </body>
</html>
