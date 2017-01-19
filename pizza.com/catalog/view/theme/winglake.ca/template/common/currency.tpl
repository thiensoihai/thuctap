<?php if (count($currencies) > 1) { ?>
<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="currency">
<li>
    <a href="javascript:void(0);">
    <?php foreach ($currencies as $currency) { ?>
    <?php if ($currency['symbol_left'] && $currency['code'] == $code) { ?>
    <?php echo $currency['title']; ?>
    <?php } elseif ($currency['symbol_right'] && $currency['code'] == $code) { ?>
    <?php echo $currency['title'].' '.$currency['symbol_right']; ?>
    <?php } ?>
    <?php } ?>
    </a>
    <ul>
      <?php foreach ($currencies as $currency) { ?>
      <?php if ($currency['symbol_left']) { ?>
      <li><a href="javascript:void(0);" class="currency-select btn btn-link btn-block" name="<?php echo $currency['code']; ?>"> <?php echo $currency['symbol_left']; ?> <?php echo $currency['title']; ?></a></li>
      <?php } else { ?>
      <li><a href="javascript:void(0);" class="currency-select btn btn-link btn-block" name="<?php echo $currency['code']; ?>"><?php echo $currency['symbol_right']; ?> <?php echo $currency['title']; ?></a></li>
      <?php } ?>
      <?php } ?>
    </ul>
</li>
  <input type="hidden" name="code" value="" />
  <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
</form>
<?php } ?>
