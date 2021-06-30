<%@ page pageEncoding="utf-8"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/profile.css" />
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div class="content-profile">
        <div class="content-profile-a">
            <div class="profile-tile">
                <h3>Thông tin cá nhân</h3>
            </div>

            <form:form class="profile-chitiet" action="profile" method="post" modelAttribute="profileuser">
                
                <div class="profile-input">
                    <p>Username</p>
                    <form:input type="text" path="username" name="username"  />
                </div>
                <div class="profile-input">
                    <p>Fullname </p>
                    <form:input type="text" path="fullname" name="fullname" value="" />
                </div>
                <div class="profile-input">
                    <p>Password</p> 
                    <form:input type="text" path="password" name="password" />
                </div>
                <div class="profile-input">
                    <p>Email</p>
                    <form:input type="text" path="email" name="email" />
                </div>
                <div class="profile-btn">
                    <button>Update</button>
                    <div class="profile-btn-cancel">
                        <a href="">Cancel</a>
                    </div>
                </div>
            </form:form>
        </div>

    </div>
    
    