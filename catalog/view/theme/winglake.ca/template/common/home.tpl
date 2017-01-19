<?php echo $header; ?>

<div id="mainContent" class="sliderBack">
  <div class="container">
        <div class="column1 pull-left">
          <div class="slider1Back">
            <div class="slider1"> <img src="catalog/view/theme/winglake.ca/img/slider1-frame.png" alt="" class="frame1">
              <div class="sliderContent">
                <div class="slider-wrapper">
                  <div id="slider1Nivo" class="nivoSlider">
                    <div class="slider1Frame"> <img src="catalog/view/theme/winglake.ca/img/content/slider_small_01.jpg" alt=""> </div>
                    <div class="slider1Frame"> <img src="catalog/view/theme/winglake.ca/img/content/slider_small_02.jpg" alt=""> </div>
                    <div class="slider1Frame"> <img src="catalog/view/theme/winglake.ca/img/content/slider_small_03.jpg" alt=""> </div>
                    <div class="slider1Frame"> <img src="catalog/view/theme/winglake.ca/img/content/slider_small_04.jpg" alt=""> </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
      <h2 class="hdr1">Fresh from the kitchen</h2>
      <h3 class="hdr2"><span class="lft"></span>Featured fine food<span class="rt"></span></h3>
      <div class="slider2">
        <ul id="anythingSlider2">

          <li>
            <div class="setSlider2">
              <?php $i=1; foreach($products_daily as $key=>$result): ?>
              <div class="third">
                <div class="mrgThird"> <span class="tx1"><?php echo $result['name']; ?></span>
                  <p><?php echo $result['description']; ?></p>
                  <span class="tx2"><?php echo $result['price']; ?>$</span>
                  <div class="shadd"> <a href="<?php echo $result['thumb']; ?>" data-rel="lightbox"><img src="<?php echo $result['thumb']; ?>" alt=""></a> </div>
                </div>
              </div>
              <?php if($i%3 == 0 && $i == 3 ){ echo '<div class="clearfix"></div> </div>  </li> <li> <div class="setSlider2">'; } ?>
              <?php $i++; endforeach; ?>
           <?php echo ((($i)%3) > 0 && (($i)%3) < 3)  ? '<div class="clearfix"></div> </div>  </li>' : '</li>'; ?>

        </ul>
        <a href="4_menucard1.html" class="link1">OPEN MENIUCARD</a> </div>
      <div class="blogContent">
        <?php foreach ($all_video as $video) { ?>
        <div class="blogTitle">
              <h2><?php echo $video['title']; ?></h2>
              <span class="category">posted</span>
              <div class="clearfix"></div>
              <div class="dates"> <span class="data1">17.04.12</span> <span class="data2">22</span> </div>
          </div>
            <img src="<?php echo $video['image']; ?>" alt="">
            <p><?php echo $video['description']; ?></p>
        <a href="<?php echo $video['view']; ?>">read more</a>
        <?php } ?>
      </div>


      <hr class="dividre1">

      <h3 class="hdr2"><span class="lft"></span>Daily Recommendations<span class="rt"></span></h3>
      <div class="threeColumnGallery">
        <?php foreach($products as $key=>$special): ?>
        <div class="third">
          <div class="mrgThird"> <span class="tx1"><?php echo $special['name'] ?></span>
            <p><?php echo $special['description'] ?></p>
            <span class="tx2"><?php echo $special['special'] ?></span><a href="<?php echo $special['href']; ?>"> <img src="<?php echo $special['thumb'] ?>" alt=""></a> </div>
        </div>
        <?php endforeach; ?>
        <div class="clearfix"></div>
      </div>
    </div>
    <div class="column2 pull-right">
      <div class="box9">
        <div class="top"></div>
        <div class="mid">
          <h4 class="curved">Book a Table</h4>
          <span class="subTitle">Its worth!</span>
          <div class="mCont">
            <form id="bkForm">
              <fieldset>
                <label class="q1"> Year
                  <input type="text">
                </label>
                <label class="q1"> Day
                  <input type="text">
                </label>
                <label class="q1"> Month
                  <input type="text">
                </label>
                <label class="q1"> Time
                  <input type="text">
                </label>
                <label class="q2"> Name
                  <input type="text">
                </label>
                <label class="q1"> Guests
                  <input type="text">
                </label>
                <label> E-mail
                  <input type="text" data-type="email">
                </label>
                <label> Telephone
                  <input type="text">
                </label>
                <label> Special request
                  <textarea></textarea>
                </label>
                <div class="clearfix"></div>
              </fieldset>
              <div class="submitHolder">
                <input type="submit" value="place booking">
              </div>
            </form>
          </div>
        </div>
        <div class="btm"></div>
      </div>
      <div class="topLightShad">
        <div class="box1">
          <div class="top"></div>
          <div class="mid">
            <h4 class="curved">Weekly Special</h4>
            <span class="subTitle">Dont Miss them!</span>
            <div class="mCont">
              <?php foreach($products as $key=>$special): ?>
              <h5><span>16.05.2012</span> <?php echo $special['name'] ?></h5>
              <p><?php echo $special['description'] ?></p>
              <a href="<?php echo $special['href'] ?>">Read More</a>
              <?php endforeach; ?>
              <div class="clearfix"></div>

            </div>
          </div>
          <div class="btm"></div>
        </div>
      </div>
      <div class="lightShad">
        <div class="box2"> Our Specials </div>
        <div class="box3"> <span class="tx1">Filet</span> <span class="tx2">Wellington</span>
          <p><strong>There are many</strong> variations of passages of Lorem Ipsum available, but the majority have suff.</p>
          <span class="tx3">Only 7.99 $</span> </div>
        <div class="box3"> <span class="tx1">Canadian</span> <span class="tx2">Lobster</span>
          <p><strong>There are many</strong> variations of passages of Lorem Ipsum available, but the majority have suff.</p>
          <span class="tx3">Only 7.99 $</span> </div>
        <h4 class="hdr3">What people say!</h4>
        <div class="box4">
          <div class="mCont"> This is my absolute favorite restaurant. Food is always fresh. Go on like that!! </div>
          <div class="btm"></div>
          <img src="img/content/avatar-say1.jpg" alt=""> <span class="author">Floyd, Cramer - Kansas</span>
          <div class="clearfix"></div>
          <hr class="divider2">
        </div>
        <div class="box4">
          <div class="mCont"> This is my absolute favorite restaurant. Food is always fresh. Go on like that!! </div>
          <div class="btm"></div>
          <img src="img/content/avatar-say1.jpg" alt=""> <span class="author">Floyd, Cramer - Kansas</span>
          <div class="clearfix"></div>
        </div>
        <br>
        <br>
        <br>
      </div>
    </div>
    <div class="c2btm">
      <div class="photoSidebar"> <img src="img/content/deco.jpg" alt=""> </div>
    </div>
    <div class="clearfix"></div>
  </div>
</div>

<?php echo $footer; ?>