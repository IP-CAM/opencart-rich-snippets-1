<!-- Navigation: Begin -->
<div class="breadcrumb" xmlns:v="http://rdf.data-vocabulary.org/#">
	<?php foreach ($breadcrumbs as $i=> $breadcrumb) { ?>
	<?php echo $breadcrumb['separator']; ?><?php if($i+1<count($breadcrumbs)) { ?><span typeof="v:Breadcrumb"><a rel="v:url" property="v:title" href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></span> <?php } else { ?><span typeof="v:Breadcrumb"><span rel="v:url" property="v:title"><?php echo $breadcrumb['text']; ?></span></span><?php } ?>
	<?php } ?>
</div>
<!-- Navigation: End -->

<!-- Snippets: Begin -->
<div itemscope itemtype="http://data-vocabulary.org/Product">
  <?php if ($manufacturer) { ?>
    <meta itemprop="brand" content="<?php echo $manufacturer; ?>">
  <?php } ?>
  <meta itemprop="name" content="<?php echo $heading_title; ?>">
  <?php if ($thumb) { ?>
    <meta itemprop="image" content="<?php echo $thumb; ?>" />
  <?php } ?>
  <?php if ($description) { ?>
      <meta itemprop="description" content="<?php echo strip_tags($description); ?>" />
  <?php } ?>

  <?php if (count($breadcrumbs) > 1) { ?>
  <?php $category = array_pop($breadcrumbs); ?>
    <meta itemprop="category" content="<?php echo $category['text']; ?>" />
  <?php } ?>
  <meta itemprop="identifier" content="mpn:<?php echo $product_id; ?>" />

  <span itemprop="offerDetails" itemscope itemtype="http://data-vocabulary.org/Offer">
    <meta itemprop="currency" content="<?php echo $this->currency->getCode(); ?>" />
    <meta itemprop="price" content="<?php echo preg_replace('/^([\s\d]+)(.*)/', '$1', ($special ? $special : $price)); ?>" />
  </span>
</div>
<!-- Snippets: End -->
