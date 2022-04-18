<cfquery datasource="warfightersupport" name="qParentMenu">
	SELECT * FROM tbl_ace_nav WHERE menuParent = 0                        
</cfquery>

<div id="about-what-we-do" style="padding-bottom:0px !important;background: black;">
	<div class="container container-mission">
		
		<div class="one-third" style="width: 158px;float: left;margin-left:70px">
			<div class="icon-left1">
				<div class="topnav" style="background: inherit;padding-left: 55px;padding-top: 12px;">
					  <a href="index.cfm">
						<img src="images/BUCKEYE.png" width="50">
						<!---<span>WARFIGHTER SUPPORT DIRECTORATE<small>Helping you make the right move</small></span>--->
					</a>
				</div>
			</div>	
		</div>
		
		<cfoutput query="qParentMenu">

			<cfif qParentMenu.menuName eq 'SUPPORT'>
				<cfset href 	= 'mailto:dll-wsd-reachback@usace.army.mil' />
				<cfset onClick 	= '' />
				<cfset imageSrc = 'images/question-circle-solid.svg' />

				<cfset one_third_style = 'width: 160px;float:left' />
			<cfelse>
				<cfset href = 'javascript:void(0);' />
				<cfset onClick = 'onclick="myFunction(this)"' />

				<cfif qParentMenu.menuName eq 'BUCKEYE'>
					<cfset imageSrc 		= 'images/plane-solid.svg' />
					<cfset one_third_style 	= 'width: 158px;float: left;' />
				<cfelseif qParentMenu.menuName eq 'FOUNDATION DATA'>
					<cfset imageSrc 		= 'images/layer-group-solid.svg' />
					<cfset one_third_style 	= 'float: left;margin-right: 14px;' />
				<cfelseif qParentMenu.menuName eq 'GEOSERVICES'>
					<cfset imageSrc 		= 'images/globe-americas-solid.svg' />
					<cfset one_third_style 	= 'width: 197px;float:left' />
				<cfelseif qParentMenu.menuName eq 'MISSION AREAS'>
					<cfset imageSrc 		= 'images/map-marked-alt-solid.svg' />
					<cfset one_third_style 	= 'float:left' />
				</cfif>

			</cfif>
			<div class="one-third" style="#one_third_style#">
				<div class="icon-left1">
					<div class="topnav" style="background: inherit;">

						<a href="#href#" #onClick# style="padding-left: 8px;padding-top: 18px;">
							<img src="#imageSrc#" width="20px">
							<h5 style="padding-left: 10px !important;">#qParentMenu.menuName#</h5>&nbsp;
							<i class="fas fa-angle-double-down" style="font-size: 20px;" id="fa_arrow"></i>
						</a>

						<cfquery datasource="warfightersupport" name="qChildMenu">
							SELECT * FROM tbl_ace_nav 
							WHERE menuParent = #qParentMenu.recordID#  
							ORDER by menuName
						</cfquery>

						<cfif qChildMenu.recordCount GT 0>

							<div id="myLinks">
								<cfloop query="#qChildMenu#">
									<a class="frame" href="#qChildMenu.menuHref#" target="_blank">#qChildMenu.menuName#</a>	
								</cfloop>
							</div>

						</cfif>
					</div>
				</div>	
			</div>
		</cfoutput>
	</div>
</div>