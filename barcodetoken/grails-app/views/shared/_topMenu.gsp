<ul class="page-head-elements">
                    <li><a href="#" class="page-navigation-toggle"><span class="fa fa-bars"></span></a></li>
                   
                </ul>
<ul class="page-head-elements pull-right">
                    <li>
                       
                        <a href="#" class="dropdown"><span class="fa fa-user"></span> <sec:username/> <i class="fa fa-caret-down"></i></a>                        
                        <div class="popup">
                            <div class="list no-controls">
                                <%--<a href="#" class="list-item">
                                    <div class="list-item-content">
                                        <h4>John Doe</h4>
                                       
                                    </div>                                
                                </a>
                                --%>
                                <a href="#" class="list-item">
                                    <div class="list-item-content">
                                        
                                       
                                    </div>                                
                                </a>
                                <sec:ifLoggedIn>
				
				
				
						<g:form controller="logout">
						<div class="list-item-content">
										<g:submitButton name="Log Out" class="btn btn-warning"/>
									</div>
									</g:form>
								</sec:ifLoggedIn>
                                
                               <a href="#" class="list-item">
                                    <div class="list-item-content">
                                        
                                       
                                    </div>                                
                                </a>
                            </div>
                            
                        </div>
                        
                    </li>
                    
                    <li><a href="#"></a></li>
                </ul>