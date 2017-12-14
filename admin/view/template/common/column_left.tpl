<div class="sidebar-menu toggle-others fixed">
		
			<div class="sidebar-menu-inner">
				
				<header class="logo-env">
		
					<!-- logo -->
					<div class="logo">
						<a href="dashboard-1.html" class="logo-expanded">
							<img src="view/assets/images/logo@2x.png" width="80" alt="" />
						</a>
		
						<a href="dashboard-1.html" class="logo-collapsed">
							<img src="view/assets/images/logo-collapsed@2x.png" width="40" alt="" />
						</a>
					</div>
		
					<!-- This will toggle the mobile menu and will be visible only on mobile devices -->
					<div class="mobile-menu-toggle visible-xs">
						<a href="#" data-toggle="user-info-menu">
							<i class="fa-bell-o"></i>
							<span class="badge badge-success">7</span>
						</a>
		
						<a href="#" data-toggle="mobile-menu">
							<i class="fa-bars"></i>
						</a>
					</div>
		
					<!-- This will open the popup with user profile settings, you can use for any purpose, just be creative 
					<div class="settings-icon">
						<a href="#" data-toggle="settings-pane" data-animate="true">
							<i class="linecons-cog"></i>
						</a>
					</div>-->
		
					
				</header>
				
				
						
				<ul id="main-menu" class="main-menu">
					<!-- add class "multiple-expanded" to allow multiple submenus to open -->
					<!-- class "auto-inherit-active-class" will automatically add "active" class for parent elements who are marked already with class "active" -->
					<?php foreach ($menus as $menu) { ?>
					    <li id="<?php echo $menu['id']; ?>" class="">
					      <?php if ($menu['href']) { ?>
					      <a href="<?php echo $menu['href']; ?>"><i class="fa <?php echo $menu['icon']; ?> fw"></i> <span class="title"><?php echo $menu['name']; ?></span></a>
					      <?php } else { ?>
					      <a href="#" class="parent"><i class="fa <?php echo $menu['icon']; ?> fw"></i> <span><?php echo $menu['name']; ?></span></a>
					      <?php } ?>
					      <?php if ($menu['children']) { ?>
					      <ul>
					        <?php foreach ($menu['children'] as $children_1) { ?>
					        <li>
					          <?php if ($children_1['href']) { ?>
					          <a href="<?php echo $children_1['href']; ?>"><?php echo $children_1['name']; ?></a>
					          <?php } else { ?>
					          <a href="#" class="parent"><?php echo $children_1['name']; ?></a>
					          <?php } ?>
					          <?php if ($children_1['children']) { ?>
					          <ul>
					            <?php foreach ($children_1['children'] as $children_2) { ?>
					            <li>
					              <?php if ($children_2['href']) { ?>
					              <a href="<?php echo $children_2['href']; ?>"><?php echo $children_2['name']; ?></a>
					              <?php } else { ?>
					              <a class="parent"><?php echo $children_2['name']; ?></a>
					              <?php } ?>
					              <?php if ($children_2['children']) { ?>
					              <ul>
					                <?php foreach ($children_2['children'] as $children_3) { ?>
					                <li><a href="<?php echo $children_3['href']; ?>"><?php echo $children_3['name']; ?></a></li>
					                <?php } ?>
					              </ul>
					              <?php } ?>
					            </li>
					            <?php } ?>
					          </ul>
					          <?php } ?>
					        </li>
					        <?php } ?>
					      </ul>
					      <?php } ?>
					    </li>
					    <?php } ?>
					
				</ul>
				
			</div>
		
		</div>
		<div class="main-content">
          
      <nav class="navbar user-info-navbar"  role="navigation"><!-- User Info, Notifications and Menu Bar -->
      
        <!-- Left links for user info navbar -->
        <ul class="user-info-menu left-links list-inline list-unstyled">
      
          <li class="hidden-sm hidden-xs">
            <a href="#" data-toggle="sidebar">
              <i class="fa-bars"></i>
            </a>
          </li>
      
          <li class="dropdown hover-line">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <i class="fa-envelope-o"></i>
              <span class="badge badge-green">15</span>
            </a>
      
            <ul class="dropdown-menu messages">
              <li>
                
                <ul class="dropdown-menu-list list-unstyled ps-scrollbar">
              
                  <li class="active"><!-- "active" class means message is unread -->
                    <a href="#">
                      <span class="line">
                        <strong>Luc Chartier</strong>
                        <span class="light small">- yesterday</span>
                      </span>
              
                      <span class="line desc small">
                        This ain’t our first item, it is the best of the rest.
                      </span>
                    </a>
                  </li>
                </ul>
              </li>
              
              <li class="external">
                <a href="mailbox-main.html">
                  <span>All Messages</span>
                  <i class="fa-link-ext"></i>
                </a>
              </li>
            </ul>
          </li>
      
          <!-- Added in v1.2 fix bro-->
          <?php if ($logged) { ?>
          <?php if($alerts > 0) { ?>
          <li class="dropdown hover-line language-switcher">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <span class="badge badge-purple"><?php echo $alerts; ?></span><?php } ?>
              <i class="fa-bell-o"></i>
            </a>
      
            <ul class="dropdown-menu languages">
            <li class="dropdown-header"><?php echo $text_order; ?></li>
              <li>
                <a href="<?php echo $processing_status; ?>" style="display: block; overflow: auto;">
                  <i class="badge badge-yellow"><?php echo $processing_status_total; ?></i>
                  <?php echo $text_processing_status; ?>
                </a>
              </li>
              <li>
                <a href="<?php echo $complete_status; ?>">
                  <i class="badge badge-green"><?php echo $complete_status_total; ?></i>
                  <?php echo $text_complete_status; ?>
                </a>
              </li>
              <li>
                <a href="<?php echo $return; ?>">
                  <i class="badge badge-red"><?php echo $return_total; ?></i>
                  <?php echo $text_return; ?>
                </a>
              </li>
              <li class="dropdown-header"><?php echo $text_customer; ?></li>
              <li>
                <a href="<?php echo $online; ?>">
                  <i class="badge badge-green"><?php echo $online_total; ?></i>
                  <?php echo $text_online; ?>
                </a>
              </li>
              <li>
                <a href="<?php echo $customer_approval; ?>">
                  <i class="badge badge-red"><?php echo $customer_total; ?></i>
                  <?php echo $text_approval; ?>
                </a>
              </li>
              <li class="dropdown-header"><?php echo $text_product; ?></li>
              <li>
                <a href="<?php echo $product; ?>">
                  <i class="badge badge-yellow"><?php echo $product_total; ?></i>
                  <?php echo $text_stock; ?>
                </a>
              </li>
              <li>
                <a href="<?php echo $review; ?>">
                  <i class="badge badge-yellow"><?php echo $review_total; ?></i>
                  <?php echo $text_review; ?>
                </a>
              </li>
              <li class="dropdown-header"><?php echo $text_affiliate; ?></li>
              <li>
                <a href="<?php echo $affiliate_approval; ?>">
                  <i class="badge badge-yellow"><?php echo $affiliate_total; ?></i>
                  <?php echo $text_approval; ?>
                </a>
              </li>
            </ul>
          </li>
      
        </ul>
        <!-- Right links for user info navbar -->
        <ul class="user-info-menu right-links list-inline list-unstyled">
          <li class="search-form"><!-- You can add "always-visible" to show make the search input visible -->
      
            <form name="userinfo_search_form" method="get" action="extra-search.html">
              <input type="text" name="s" class="form-control search-field" placeholder="Type to search..." />
      
              <button type="submit" class="btn btn-link">
                <i class="linecons-search"></i>
              </button>
            </form>
      
          </li>
      
          <li class="dropdown user-profile">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <?php if ($image) { ?>
              <img src="<?php echo $image; ?>" title="<?php echo $user_group;?>" alt="<?php echo $firstname; ?> <?php echo $lastname; ?>" class="img-circle img-inline userpic-32" width="28" />
              <?php } else { ?>
              <i class="fa fa-opencart fw"></i>
              <?php } ?>
              <span class="line" title="<?php echo $user_group;?>">
              <?php echo $firstname; ?> <?php echo $lastname; ?>
              <i class="fa-angle-down" title="<?php echo $user_group;?>"></i>
              </span>
            </a>
      
            <ul class="dropdown-menu user-profile-menu list-unstyled">
              <?php foreach ($stores as $store) { ?>
              <li>
                <a href="<?php echo $store['href']; ?>">
                  <i class="fa-edit"></i>
                  <?php echo $store['name']; ?>
                </a>
              </li>
              <?php } ?>
              <li><a href="http://www.opencart.com" target="_blank"><?php echo $text_homepage; ?></a></li>
              <li><a href="http://docs.opencart.com" target="_blank"><?php echo $text_documentation;?></a></li>
              <li><a href="http://forum.opencart.com" target="_blank"><?php echo $text_support; ?></a></li>
              <li>
                <a href="<?php echo $logout; ?>"><i class="fa fa-sign-out fa-lg"></i><span class="hidden-xs hidden-sm hidden-md"><?php echo $text_logout; ?></span> </a>
              </li>
            </ul>
          </li>     
        </ul>
        <?php } ?>
      </nav>