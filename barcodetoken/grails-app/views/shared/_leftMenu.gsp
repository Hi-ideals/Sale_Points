<div class="page-navigation">
                
                <div class="page-navigation-info">
                    <g:link controller="home" action="dashboard" ><p style="color:#fff"><img src="images/favicon.png" />  Hi-Ideals Technologies Pvt Ltd</p></g:link>
                	
                </div>

                <ul class="navigation">
                	<li><a><i class="fa fa-ticket"></i>Token Points Generate System </a></li>
                    <li class="${active?.getAt('dashboard')}"><g:link controller="home" action="dashboard"><i class="fa fa-dashboard"></i> Dashboard</g:link></li>
                   <li class="${active?.getAt('ProductHeader')}"><a href="#"><i class="fa fa-tags"></i> Add Product</a>
                        <ul>
                            <li class="${active?.getAt('CreateProduct')}"><g:link controller="products" action="create">Create Product</g:link></li>
                            <li class="${active?.getAt('ProductList')}"><g:link controller="products" action="index">List of Products</g:link></li>
                           
                        </ul>
                    </li>  
                    <li class="${active?.getAt('UserHeader')}"><a href="#"><i class="fa fa-group"></i> Add Customers</a>
                        <ul>
                            <li class="${active?.getAt('CreateUser')}"><g:link controller="users" action="create">Create Customer</g:link></li>
                            <li class="${active?.getAt('UserList')}"><g:link controller="users" action="index">List of Customers</g:link></li>
                           
                        </ul>
                    </li>  
						
                    
                    
                    <li class="${active?.getAt('UserPointHeader')}"><a href="#"><i class="fa fa-bars"></i> Customer Points</a>
                        <ul>
                            <li class="${active?.getAt('CreateUserPoint')}" ><g:link controller="assignPoints" action="create">Assign Points</g:link></li>
                            <li class="${active?.getAt('RedeemUserPoint')}" ><g:link controller="assignPoints" action="redeemPoints1">Redeem Points</g:link></li>
                            <li class="${active?.getAt('UserPointList')}"><g:link controller="assignPoints" action="index">List of Customer Points</g:link></li>
                           
                        </ul>
                    </li>     
                     
                    <li class="${active?.getAt('ReportHeader')}" ><a href="#"><i class="fa fa-print"></i>Reports</a>
                        <ul>
                            <li class="${active?.getAt('Report')}"><g:link controller="reports" action="index">By Date/Unique Number</g:link></li>
                           
                        </ul>
                    </li>  
                                     
                </ul>
                
              
                
            </div>
